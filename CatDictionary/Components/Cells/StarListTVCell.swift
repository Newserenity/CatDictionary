//
//  StarListTVCell.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/17.
//

import UIKit
import Then

final class StarListTVCell: UICollectionViewCell {
    
    fileprivate lazy var imageView = UIImageView().then {
        $0.backgroundColor = .systemGray6
    }
    
    fileprivate lazy var stackView = UIStackView().then {
        $0.backgroundColor = .yellow
    }
    
    fileprivate lazy var dateLabel = UILabel().then {
        $0.textAlignment = .left
        $0.text = "0000/00/00 00:00 MON"
        
    }
    fileprivate lazy var imageIdLabel = UILabel().then {
        $0.textAlignment = .left
        $0.text = "ABCDEFG"
    }
    fileprivate lazy var seqIdLabel = UILabel().then {
        $0.textAlignment = .left
        $0.text = "0000000"
    }
    
    fileprivate lazy var removeButton = UIButton().then {
        $0.backgroundColor = .brown
        $0.tintColor = .black
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
extension StarListTVCell {

}

// MARK: - addSubview 관련
extension StarListTVCell {
    fileprivate func configAddSubview() {
        self.addSubview(imageView)
        self.addSubview(stackView)
        self.addSubview(removeButton)
        stackView.addSubview(dateLabel)
        stackView.addSubview(imageIdLabel)
        stackView.addSubview(seqIdLabel)
    }
}

// MARK: - Autolayout 관련
extension StarListTVCell {
    fileprivate func configLayout() {
        imageView.snp.makeConstraints {
            $0.size.equalTo(100)
            $0.top.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().inset(10)
            $0.left.equalToSuperview().offset(10)
        }
        
        stackView.snp.makeConstraints {
            $0.left.equalTo(imageView.snp.right).offset(10)
            $0.verticalEdges.equalToSuperview()
            $0.width.equalTo(300)
        }
        
        seqIdLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(15)
            $0.left.equalToSuperview().offset(15)
        }
        
        dateLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(15)
            $0.left.equalToSuperview().offset(15)
        }
        
        imageIdLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.left.equalToSuperview().offset(15)
        }
        removeButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().inset(10)
        }
    }
}


// MARK: - Preview 관련
#if DEBUG

import SwiftUI

struct StarListTVCell_Previews: PreviewProvider {
    static var previews: some View {
        StarListTVCell()
            .getPreview()
            .frame(width: 500, height: 120)
            .previewLayout(.sizeThatFits)
        
    }
}

#endif
