//
//  StarListTVCell.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/17.
//

import UIKit
import Then

final class StarListTVCell: UITableViewCell {
    
    fileprivate lazy var catImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 90, height: 90)).then {
        $0.backgroundColor = .systemGray6
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 10
    }
    
    fileprivate lazy var stackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fill
        $0.spacing = 5
    }
    
    fileprivate lazy var dateLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .bold)
        $0.textAlignment = .left
        $0.text = "0000/00/00 00:00 MON"
        
    }
    fileprivate lazy var imageIdLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textAlignment = .left
        $0.text = "ABCDEFG"
    }
    fileprivate lazy var seqIdLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textAlignment = .left
        $0.text = "0000000"
    }
    
    fileprivate var imageUrl: String? {
        didSet {
            loadImage()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        configLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Getter, Setter 모음
extension StarListTVCell {
    public func setElement(seq: String, imageId: String, date: String, imageUrl: String) {
        self.seqIdLabel.text = seq
        self.imageIdLabel.text = imageId
        self.dateLabel.text = date
        self.imageUrl = imageUrl
        self.layoutIfNeeded()
    }
}

// MARK: - Fetching image from url by KF
extension StarListTVCell {
    private func loadImage() {
        guard let urlString = self.imageUrl, let url = URL(string: urlString)  else { return }
        catImage.kf.setImage(with: url)
    }
}


// MARK: - Autolayout 관련
extension StarListTVCell {
    fileprivate func configLayout() {
        
        self.contentView.setNeedsLayout()
        self.contentView.layoutIfNeeded()
        
        self.selectionStyle = .none
        self.contentView.addSubview(catImage)
        self.contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(seqIdLabel)
        stackView.addArrangedSubview(imageIdLabel)
        stackView.addArrangedSubview(dateLabel)

        catImage.snp.makeConstraints{
            $0.size.equalTo(90)
            $0.verticalEdges.equalToSuperview().inset(10
            )
            $0.leading.equalToSuperview()
        }
        
        stackView.snp.makeConstraints{
            $0.verticalEdges.trailing.equalToSuperview().inset(20)
            $0.leading.equalTo(catImage.snp.trailing).offset(20)
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
            .frame(width: 500, height: 100)
            .previewLayout(.sizeThatFits)

    }
}

#endif
