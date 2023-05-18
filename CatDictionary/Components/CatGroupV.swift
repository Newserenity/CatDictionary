//
//  CatGroupV.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/18.
//

import UIKit
import SnapKit
import Then

final class CatGroupV: UICollectionView {
    
    fileprivate var catsArr: CatExploreRes = []
    fileprivate lazy var refresh = UIRefreshControl().then {
        $0.addTarget(self, action: #selector(handleRefreshControl) , for: .valueChanged)
    }
    
    private var flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    
    // Life Cycle
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        configDelegate()
        configUI()
        configLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        flowLayout.itemSize = CGSize(width: self.frame.width/3 - 7, height: self.frame.width/3 - 7 + 40)
        self.collectionViewLayout = flowLayout
        self.showsVerticalScrollIndicator = false
    }
    
    @objc func handleRefreshControl() {
       // Update your content…
        NetworkManager.shared.fetchMainCatList { res in
            self.catsArr = res
            self.reloadData()
        }

       // Dismiss the refresh control.
       DispatchQueue.main.async {
           self.refreshControl?.endRefreshing()
       }
    }
}

// MARK: - Getter, Setter 모음
extension CatGroupV {
    public func setCatsArr(_ arr: CatExploreRes) {
        self.catsArr = arr
        self.reloadData()
    }
    
    //setter 설정방법 찾기
//    public func setCollectionView(_ data: UIRefreshControl) {
//        self.collectionView.refreshControl = data
//    }
}

// MARK: - self UI 관련
extension CatGroupV {
    fileprivate func configUI() {
        
    }
}

// MARK: - 대리자 설정
extension CatGroupV {
    fileprivate func configDelegate() {
        self.dataSource = self
        self.delegate = self
        
    // regist Cell
        self.register(CatCVCell.self, forCellWithReuseIdentifier: IDENTIFIER.CAT_CV_CELL)
    }
}


// MARK: - autoLayout 관련
extension CatGroupV {
    fileprivate func configLayout() {
        
        self.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension CatGroupV: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // 컬렉션뷰에 몇개의 데이터를 표시할 것인지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if catsArr.count == 0 {
//            return 21
//        } else {
//            return catsArr.count
//        }
        
        return catsArr.count
    }
    
    // 셀의 구성(셀에 표시하고자 하는 데이터 표시)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IDENTIFIER.CAT_CV_CELL, for: indexPath) as! CatCVCell

        cell.setImageUrl(catsArr[indexPath.row].imageUrl!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

// MARK: - Preview 관련
#if DEBUG

import SwiftUI

struct CatGroupV_Previews: PreviewProvider {
    static var previews: some View {
        CatGroupV()
            .getPreview()
            .previewLayout(.sizeThatFits)
    }
}

#endif
