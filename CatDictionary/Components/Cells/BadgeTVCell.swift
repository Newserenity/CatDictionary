//
//  BadgeTableViewCell.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/09.
//

import UIKit
import Then

final class BadgeTVCell: UICollectionViewCell {
    
    static let identifier = "badgeTVCell"
    
    fileprivate lazy var selectedMenuItem: String = "Deafalt"
    fileprivate lazy var titleLablel = UILabel().then {
        $0.text = selectedMenuItem
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textAlignment = .center
        $0.textColor = .white
        $0.numberOfLines = 1
    }
    fileprivate lazy var titleLablelBg = UIView().then {
        $0.backgroundColor = .systemTeal
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 15 //높이에 따라 동적으로 변하게 수정
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configAddSubview()
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

// MARK: - static 메소드 관련
extension BadgeTVCell {
    
    /// 벳지 만들기
    /// - Returns: 만들어진 벳지
    static func generateMyCardView() -> UICollectionViewCell {
        return BadgeTVCell()
    }
}

// MARK: - addSubview 관련
extension BadgeTVCell {
    fileprivate func configAddSubview() {
        addSubview(titleLablelBg)
        self.titleLablelBg.addSubview(titleLablel)
    }
}

// MARK: - Autolayout 관련
extension BadgeTVCell {
    fileprivate func configLayout() {
        titleLablelBg.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(titleLablel.snp.width).offset(30)
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

struct BadgeTVCell_Previews: PreviewProvider {
    static var previews: some View {
        BadgeTVCell()
            .getPreview()
            .frame(width: 100, height: 50)
            .previewLayout(.sizeThatFits)
        
    }
}

#endif
