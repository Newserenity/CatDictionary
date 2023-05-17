//
//  BadgeTableView.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/09.
//

import UIKit
import Then
import SnapKit

final class BadgeGroupV: UIView {
    
    fileprivate var categoryArr: CategoryRes = []
    
    private let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.minimumLineSpacing = 5
//        $0.sectionInset = UIEdgeInsets.init(top: 10 , left: 20, bottom: 10, right: 20)
    }
    
    fileprivate lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configDelegate()
        configAddSubview()
        configLayout()
        configCV()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

// MARK: - Getter, Setter 모음
extension BadgeGroupV {
    public func setCategoryArr(_ arr: CategoryRes) {
        self.categoryArr = arr
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout (collectionView의 전체적인 레이아웃 설정)
extension BadgeGroupV: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let category = categoryArr[indexPath.row].categoryName ?? "defulat"
        
        // 나중에 사용하고있는 폰트의 크기값으로 변경
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
        
        // 현재 categoryArr값안에 있는 String에 대한 값의 사이즈를 가져옴
        let categorySize = category.size(withAttributes: attributes as [NSAttributedString.Key: Any])
        
        /*
          사이즈값에 대한 여백 설정 양옆 15씩 위아래 5씩
          BadgeTVCell에 있는 Label의 autoLayout을 여기서 줬다고 생각하면 편함
         */
        return CGSize(width: categorySize.width + 15 + 15, height: 20 + 5 + 5)
    }
}

// MARK: - collectionView 설정 관련
extension BadgeGroupV {
    fileprivate func configCV() {
        collectionView.showsHorizontalScrollIndicator = false
    }
}

// MARK: - Self UI setting
extension BadgeGroupV {
    fileprivate func configUI() {
        
    }
}

// MARK: - Delegate setting 및 셀등록
extension BadgeGroupV {
    fileprivate func configDelegate() {
    collectionView.dataSource = self
    collectionView.delegate = self
        
    // regist Cell
        collectionView.register(BadgeTVCell.self, forCellWithReuseIdentifier: IDENTIFIER.BADGE_TV_CELL)
    }
}

// MARK: - AddSubview setting
extension BadgeGroupV {
    fileprivate func configAddSubview() {
        addSubview(collectionView)
    }
}

// MARK: - AutoLayout setting
extension BadgeGroupV {
    fileprivate func configLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDelegate 관련
// dequeueReusableCell
extension BadgeGroupV: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // 컬렉션뷰에 몇개의 데이터를 표시할 것인지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArr.count
    }
    
    // 셀의 구성(셀에 표시하고자 하는 데이터 표시)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IDENTIFIER.BADGE_TV_CELL, for: indexPath) as! BadgeTVCell
        cell.setTitleLabel(categoryArr[indexPath.row].categoryName!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function, "path : \(indexPath)")
    }
}

// MARK: - static 메소드 관련
extension BadgeGroupV {
    static func generateBadgeComponentsView() -> UIView {
        return BadgeGroupV()
    }
}

// MARK: - Preview 관련
#if DEBUG

import SwiftUI

struct BadgeComponentsView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeGroupV()
            .getPreview()
            .frame(width: 500, height: 100)
            .previewLayout(.sizeThatFits)
    }
}

#endif
