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
        $0.backgroundColor = .systemTeal
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 15 //높이에 따라 동적으로 변하게 수정
    }
    
    //FIXME: 굳이 View를 만들지 않아도, UILabel안에서 BackgroundColor값과 cornerRadius값을 지정할 수 있음!!!!!! 해당View는 무의미!
//    fileprivate lazy var titleLablelBg = UIView().then {
//        $0.backgroundColor = .systemTeal
//        $0.layer.masksToBounds = true
//        $0.layer.cornerRadius = 15 //높이에 따라 동적으로 변하게 수정
//    }
    
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
        addSubview(titleLablel)
    }
}

// MARK: - Autolayout 관련
extension BadgeTVCell {
    fileprivate func configLayout() {
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
