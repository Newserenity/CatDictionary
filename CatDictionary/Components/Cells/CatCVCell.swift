//
//  CatCollectionViewCell.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/08.
//

import UIKit
import SnapKit
import Then

final class CatCVCell: UICollectionViewCell {

    static let identifier = "catCVCell" // identifier
    
    fileprivate lazy var imageView = UIImageView().then {
        $0.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configUI()
        configAddSubview()
        configAutolayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Getter, Setter 모음
extension CatCVCell {
    func setImageView(_ image: UIImage) {
        self.imageView.image = image
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
