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
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }

    fileprivate var imageUrl: String? {
        didSet {
            loadImage()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configUI()
        configAddSubview()
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

// MARK: - Getter, Setter 모음
extension CatCVCell {
    func setImageUrl(_ url: String) {
        self.imageUrl = url
    }
}

extension CatCVCell {
    private func loadImage() {
        imageView.layer.cornerRadius = 10
        guard let urlString = self.imageUrl, let url = URL(string: urlString)  else { return }
        imageView.kf.setImage(with: url)
    }
}

// MARK: - self UI 세팅
extension CatCVCell {
    fileprivate func configUI() {
        self.backgroundColor = .systemGray5
        self.layer.cornerRadius = 10
    }
}

// MARK: - static 메소드 관련
extension CatCVCell {
    
    /// Cat Cell  만들기
    /// - Returns: Cat Cell
    static func generateCatCollectionViewCell() -> UIView {
        return CatCVCell()
    }
}

// MARK: - AddSubview setting
extension CatCVCell {
    fileprivate func configAddSubview() {
        addSubview(imageView)
    }
}

// MARK: - AutoLayout setting
extension CatCVCell {
    fileprivate func configAutolayout() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
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
