//
//  CatCollectionViewCell.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/08.
//

import UIKit
import SnapKit
import Then
import Kingfisher

final class CatCVCell: UICollectionViewCell {
    
    fileprivate lazy var imageView = UIImageView().then {
        $0.backgroundColor = .systemGray6
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 10
    }
    
    private var config = UIButton.Configuration.plain()
    fileprivate lazy var starButton = UIButton().then {
        $0.addBlurEffect(cornerRadius: 10)
        $0.addTarget(self, action: #selector(btnPressed), for: .touchUpInside)
        config.title = "✨STAR!"
        config.baseBackgroundColor = .systemGray3.withAlphaComponent(0.75)
        config.baseForegroundColor = .systemGray6
        $0.configuration = self.config
    }
    
    fileprivate var imageUrl: String? {
        didSet {
            loadImage()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configProperty()
        configAutolayout()
        
    }
    
    // 셀이 재사용되기 전에 호출되는 메서드
    override func prepareForReuse() {
        super.prepareForReuse()
        // 이미지가 바뀌는 것처럼 보이는 현상을 없애기 위해서 실행
        self.imageView.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - event hander
extension CatCVCell {
    @objc fileprivate func btnPressed() {
        
    }
}

// MARK: - Setting Self
extension CatCVCell {
    // self stored property
    fileprivate func configProperty() {
        self.backgroundColor = .systemGray5
        self.layer.cornerRadius = 10
    }
}

// MARK: - Getter, Setter 모음
extension CatCVCell {
    func setImageUrl(_ url: String) {
        self.imageUrl = url
    }
}

// MARK: - Fetching image from url by KF
extension CatCVCell {
    private func loadImage() {
        guard let urlString = self.imageUrl, let url = URL(string: urlString)  else { return }
        imageView.kf.setImage(with: url)
    }
}


// MARK: - AutoLayout setting
extension CatCVCell {
    fileprivate func configAutolayout() {
        addSubview(imageView)
        addSubview(starButton)
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        starButton.snp.makeConstraints {
            $0.bottom.equalTo(imageView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
        }
    }
}


// MARK: - Preview 관련
#if DEBUG

import SwiftUI

struct CatCVCell_Previews: PreviewProvider {
    static var previews: some View {
        CatCVCell()
            .getPreview()
            .frame(width: 140, height: 140)
            .previewLayout(.sizeThatFits)
        
    }
}

#endif
