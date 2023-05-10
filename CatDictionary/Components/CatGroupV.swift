//
//  CatCollectionView.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/08.
//

import UIKit
import SnapKit
import Then

final class CatGroupV: UIView {
    
    fileprivate let catsArr = ["cat1", "cat2", "cat3", "cat4", "cat5", "cat6"]
    fileprivate lazy var subtitle = UILabel().then {
        $0.text = "T'ekaaluk"
        $0.font = UIFont.systemFont(ofSize: 25, weight: .bold)
    }
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
        flowLayout.itemSize = CGSize(width: self.frame.width/3 - 8, height: self.frame.width/3 - 8)
        collectionView.collectionViewLayout = flowLayout
    }
}

// MARK: - self UI 관련
extension CatGroupV {
    fileprivate func configUI() {
        
    }
}

// MARK: - 대리자 설정
extension CatGroupV {
    fileprivate func configDelegate() {
    collectionView.dataSource = self
    collectionView.delegate = self
        
    // regist Cell
    collectionView.register(CatCVCell.self, forCellWithReuseIdentifier: "catCVCell")
    }
}

// MARK: - addSubview 관련
extension CatGroupV {
    fileprivate func configAddSubview() {
        self.addSubview(collectionView)
        self.addSubview(subtitle)
    }
}

// MARK: - autoLayout 관련
extension CatGroupV {
    fileprivate func configLayout() {
        
        collectionView.snp.makeConstraints {
            $0.bottom.left.right.equalToSuperview()
            $0.top.equalTo(subtitle.snp.bottom).offset(10)
        }
        
        subtitle.snp.makeConstraints {
            $0.top.left.equalToSuperview().offset(10)
        }
        
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "catCVCell", for: indexPath) as! CatCVCell
        
        cell.setImageView(UIImage(systemName: "person.fill")!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function, "path : \(indexPath)")
    }
}

// MARK: - static 메소드 관련
extension CatGroupV {
    static func generateCatGroupV() -> UIView {
        return CatGroupV()
    }
}

// MARK: - Preview 관련
#if DEBUG

import SwiftUI

struct CatGroupV_Previews: PreviewProvider {
    static var previews: some View {
        CatGroupV()
            .getPreview()
            .frame(width: 400, height: 330)
            .previewLayout(.sizeThatFits)
    }
}

#endif
