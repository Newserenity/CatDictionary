//
//  BadgeTableViewCell.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/09.
//

import UIKit
import Then

final class BadgeTVCell: UICollectionViewCell {
    
    fileprivate lazy var selectedMenuItem: String = "Deafalt"
    fileprivate lazy var titleLablel = UILabel().then {
        $0.text = selectedMenuItem
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textAlignment = .center
        $0.textColor = .white
        $0.numberOfLines = 1
        $0.backgroundColor = .systemTeal
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 15 //높이에 따라 동적으로 변하게 수정
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Getter, Setter 모음
extension BadgeTVCell {
    func setTitleLabel(_ text: String) {
        self.titleLablel.text = text
    }
}


// MARK: - Addsubview / Autolayout 관련
extension BadgeTVCell {
    fileprivate func configLayout() {
        addSubview(titleLablel)
        
        titleLablel.snp.makeConstraints {
            // 여백 지정값의 경우 collectionView FlowLayoutDelegate에서 지정해줄거니 제약조건을 모두 SuperView에 맞춤
            $0.edges.equalToSuperview()
        }
    }
}


// MARK: - Preview 관련
#if DEBUG

import SwiftUI

struct BadgeTVCell_Previews: PreviewProvider {
    static var previews: some View {
        BadgeTVCell()
            .getPreview()
            .frame(width: 100, height: 50)
            .previewLayout(.sizeThatFits)
        
    }
}

#endif
