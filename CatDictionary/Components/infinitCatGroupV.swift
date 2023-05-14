//
//  infinitCatGroupV.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/11.
//

import UIKit
import SnapKit
import Then

final class infinitCatGroupV: UIView {
    
    fileprivate var catsArr:CatExploreRes = []

    fileprivate lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        configDelegate()
        configUI()
        configAddSubview()
        configLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: self.frame.width/3 - 7, height: self.frame.width/3 - 7)
        collectionView.collectionViewLayout = flowLayout
        collectionView.showsVerticalScrollIndicator = false
    }
}

// MARK: - Getter, Setter 모음
extension infinitCatGroupV {
    public func setCatsArr(_ arr: CatExploreRes) {
        self.catsArr = arr
        collectionView.reloadData()
    }
}

// MARK: - self UI 관련
extension infinitCatGroupV {
    fileprivate func configUI() {
        
    }
}

// MARK: - 대리자 설정
extension infinitCatGroupV {
    fileprivate func configDelegate() {
    collectionView.dataSource = self
    collectionView.delegate = self
        
    // regist Cell
        collectionView.register(CatCVCell.self, forCellWithReuseIdentifier: CatCVCell.identifier)
    }
}

// MARK: - addSubview 관련
extension infinitCatGroupV {
    fileprivate func configAddSubview() {
        self.addSubview(collectionView)
    }
}

// MARK: - autoLayout 관련
extension infinitCatGroupV {
    fileprivate func configLayout() {
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension infinitCatGroupV: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // 컬렉션뷰에 몇개의 데이터를 표시할 것인지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catsArr.count
    }
    
    // 셀의 구성(셀에 표시하고자 하는 데이터 표시)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatCVCell.identifier, for: indexPath) as! CatCVCell
//        cell.setImageView(UIImage(systemName: "person.fill")!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

// MARK: - Preview 관련
#if DEBUG

import SwiftUI

struct infinitCatGroupV_Previews: PreviewProvider {
    static var previews: some View {
        infinitCatGroupV()
            .getPreview()
            .previewLayout(.sizeThatFits)
    }
}

#endif
