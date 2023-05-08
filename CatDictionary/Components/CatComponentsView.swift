//
//  CatCollectionView.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/08.
//

import UIKit
import SnapKit
import Then

final class CatComponentsView: UIView {
    
    // Elements
    fileprivate lazy var subtitle = UILabel().then {
        $0.text = "때껄룩 모음"
        $0.font = UIFont.systemFont(ofSize: 25, weight: .bold)
    }
    
    fileprivate let catsArr = ["cat1", "cat2", "cat3", "cat4", "cat5", "cat6"]
    
    fileprivate lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        configDelegate()
        configUI()
        configAddSubview()
        configAutolayout()
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

// MARK: - Self UI setting
extension CatComponentsView {
    fileprivate func configUI() {
        
    }
}

// MARK: - Delegate setting
extension CatComponentsView {
    fileprivate func configDelegate() {
    collectionView.dataSource = self
    collectionView.delegate = self
        
    // regist Cell
    collectionView.register(CatCollectionViewCell.self, forCellWithReuseIdentifier: "catCollectionViewCell")
    }
}

// MARK: - AddSubview setting
extension CatComponentsView {
    fileprivate func configAddSubview() {
        self.addSubview(collectionView)
        self.addSubview(subtitle)
    }
}

// MARK: - AutoLayout setting
extension CatComponentsView {
    fileprivate func configAutolayout() {
        
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
extension CatComponentsView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // 컬렉션뷰에 몇개의 데이터를 표시할 것인지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catsArr.count
    }
    
    // 셀의 구성(셀에 표시하고자 하는 데이터 표시)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "catCollectionViewCell", for: indexPath) as! CatCollectionViewCell

        cell.imageView.image = UIImage(systemName: "tray.full.fill")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function, "path : \(indexPath)")
    }
}

// MARK: - static 메소드 관련
extension CatComponentsView {
    
    /// cat collection 만들기
    /// - Returns: 만들어진 collection
    static func generateCatComponentsView() -> UIView {
        return CatComponentsView()
    }
}

// MARK: - Preview 관련
#if DEBUG

import SwiftUI

struct CatComponentsView_Previews: PreviewProvider {
    static var previews: some View {
        CatComponentsView()
            .getPreview()
            .frame(width: 400, height: 330)
            .previewLayout(.sizeThatFits)
    }
}

#endif
