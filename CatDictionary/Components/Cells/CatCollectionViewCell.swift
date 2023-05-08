//
//  CatCollectionViewCell.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/08.
//

import UIKit
import SnapKit
import Then

final class CatCollectionViewCell: UICollectionViewCell {
    static let identifier = "CatCollectionViewCell"
    
    var imageView = UIImageView().then {
        $0.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray5
        
        
        addSubViewConfig()
        autolayoutConfig()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - static 메소드 관련
extension CatCollectionViewCell {
    
    /// Cat Cell  만들기
    /// - Returns: Cat Cell
    static func generateCatCollectionViewCell() -> UIView {
        return CatCollectionViewCell()
    }
}

// MARK: - AddSubview setting
extension CatCollectionViewCell {
    fileprivate func addSubViewConfig() {
        addSubview(imageView)
    }
}

// MARK: - AutoLayout setting
extension CatCollectionViewCell {
    fileprivate func autolayoutConfig() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}


// MARK: - Preview 관련
#if DEBUG

import SwiftUI

struct CatCollectionViewCell_Previews: PreviewProvider {
    static var previews: some View {
        CatCollectionViewCell()
            .getPreview()
            .frame(width: 140, height: 140)
            .previewLayout(.sizeThatFits)
        
    }
}

#endif
