//
//  BadgeTableView.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/09.
//

import UIKit
import Then
import SnapKit

final class BadgeComponentsView: UIView {
    
    // {{endpoint}}v1/categories 에서 fetch 예정
    fileprivate let catsArr = ["boxes", "clothes", "hats", "sinks", "space", "sunglasses", "ties"]
    
    fileprivate lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configDelegate()
        configAddSubview()
        configAutolayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 30
        flowLayout.sectionInset = UIEdgeInsets.init(top: 10 , left: 20, bottom: 10, right: 20)
//        flowLayout.itemSize = CGSize(width: self.frame.width/3 - 8, height: self.frame.width/3 - 8)
        collectionView.collectionViewLayout = flowLayout
        collectionView.showsHorizontalScrollIndicator = false
    }
    
}

// MARK: - Self UI setting
extension BadgeComponentsView {
    fileprivate func configUI() {
        
    }
}

// MARK: - Delegate setting
extension BadgeComponentsView {
    fileprivate func configDelegate() {
    collectionView.dataSource = self
    collectionView.delegate = self
        
    // regist Cell
    collectionView.register(BadgeTableViewCell.self, forCellWithReuseIdentifier: "badgeTableViewCell")
    }
}

// MARK: - AddSubview setting
extension BadgeComponentsView {
    fileprivate func configAddSubview() {
        addSubview(collectionView)
    }
}

// MARK: - AutoLayout setting
extension BadgeComponentsView {
    fileprivate func configAutolayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension BadgeComponentsView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // 컬렉션뷰에 몇개의 데이터를 표시할 것인지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catsArr.count
    }
    
    // 셀의 구성(셀에 표시하고자 하는 데이터 표시)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "badgeTableViewCell", for: indexPath) as! BadgeTableViewCell

        cell.titleLablel.text = catsArr[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function, "path : \(indexPath)")
    }
}

// MARK: - static 메소드 관련
extension BadgeComponentsView {
    
    /// cat collection 만들기
    /// - Returns: 만들어진 collection
    static func generateBadgeComponentsView() -> UIView {
        return BadgeComponentsView()
    }
}

// MARK: - Preview 관련
#if DEBUG

import SwiftUI

struct BadgeComponentsView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeComponentsView()
            .getPreview()
            .frame(width: 500, height: 100)
            .previewLayout(.sizeThatFits)
    }
}

#endif
