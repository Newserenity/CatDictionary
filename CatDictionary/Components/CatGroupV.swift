//
//  CatGroupV.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/18.
//

import UIKit
import SnapKit
import Then

final class CatGroupV: UIView {
    
    fileprivate var catsArr: CatExploreRes = []
    fileprivate lazy var refresh = UIRefreshControl().then {
        $0.addTarget(self, action: #selector(handleRefreshControl) , for: .valueChanged)
    }
    
    private var flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    fileprivate lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout).then {
        $0.refreshControl = self.refresh
        $0.showsVerticalScrollIndicator = false
    }
    
    // Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configProperty()
        configLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // layoutSubviews
    override func layoutSubviews() {
        flowLayout.itemSize = CGSize(width: self.frame.width/3 - 7, height: self.frame.width/3 - 7 + 40)
        self.collectionView.collectionViewLayout = flowLayout
    }
}

// MARK: - event handler
extension CatGroupV {
    @objc fileprivate func handleRefreshControl() {
        
       // Update your content…
        NetworkManager.shared.fetchMainCatList { res, err in
            
            if let safeRes = res {
                self.catsArr = safeRes
                self.collectionView.reloadData()
            }
            
            if let safeErr = err {
                print(#fileID, #function, #line, "- \(safeErr)")
            }
        }
        
        

       // Dismiss the refresh control.
       DispatchQueue.main.async {
           self.collectionView.refreshControl?.endRefreshing()
       }
    }
}

// MARK: - Getter, Setter 모음
extension CatGroupV {
    public func setCatsArr(_ arr: CatExploreRes) {
        self.catsArr = arr
        self.collectionView.reloadData()
    }
}

// MARK: - configProperty
extension CatGroupV {
    fileprivate func configProperty() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.collectionView.register(CatCVCell.self, forCellWithReuseIdentifier: IDENTIFIER.CAT_CV_CELL)
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension CatGroupV: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // 컬렉션뷰에 몇개의 데이터를 표시할 것인지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catsArr.count
    }
    
    // 셀의 구성(셀에 표시하고자 하는 데이터 표시)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IDENTIFIER.CAT_CV_CELL, for: indexPath) as! CatCVCell

        cell.setImageUrl(catsArr[indexPath.row].imageUrl!)
        
        return cell
    }
}

// MARK: - AutoLayout setting
extension CatGroupV {
    fileprivate func configLayout() {
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
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
