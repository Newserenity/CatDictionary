//
//  BadgeTableViewCell.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/09.
//

import UIKit
import Then

final class BadgeTableViewCell: UICollectionViewCell {
    
    static let identifier = "badgeTableViewCell"
    
    let selectedMenuItem: String = "Deafalt"
    
    lazy var titleLablel = UILabel().then {
        $0.text = selectedMenuItem
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textAlignment = .center
        $0.textColor = .white
        $0.numberOfLines = 1
    }
    
    let titleLablelBg = UIView().then {
        $0.backgroundColor = .systemTeal
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 15 //높이에 따라 동적으로 변하게 수정
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configAddSubview()
        configAutolayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

// MARK: - static 메소드 관련
extension BadgeTableViewCell {
    
    /// 벳지 만들기
    /// - Returns: 만들어진 벳지
    static func generateMyCardView() -> UICollectionViewCell {
        return BadgeTableViewCell()
    }
}

// MARK: - AddSubview setting
extension BadgeTableViewCell {
    fileprivate func configAddSubview() {
        addSubview(titleLablelBg)
        self.titleLablelBg.addSubview(titleLablel)
    }
}

// MARK: - AutoLayout setting
extension BadgeTableViewCell {
    fileprivate func configAutolayout() {
        titleLablelBg.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        titleLablel.snp.makeConstraints {
            $0.height.equalTo(20)
            $0.width.lessThanOrEqualTo(100)
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15))
            
        }
    }
}


// MARK: - Preview 관련
#if DEBUG

import SwiftUI

struct BadgeTableViewCell_Previews: PreviewProvider {
    static var previews: some View {
        BadgeTableViewCell()
            .getPreview()
            .frame(width: 100, height: 50)
            .previewLayout(.sizeThatFits)
        
    }
}

#endif
