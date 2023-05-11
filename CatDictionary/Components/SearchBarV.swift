//
//  SearchBarView.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/08.
//


import UIKit
import SnapKit
import Then

final class SearchBarV: UIView {
    
    fileprivate lazy var searchBarSV = UIStackView().then {
        $0.distribution = .fill
        $0.alignment = .center
        $0.axis = .horizontal
        $0.spacing = 10
        $0.backgroundColor = .white
        
        $0.layer.cornerRadius = 55/2
        
        $0.layer.masksToBounds = false
        $0.layer.shadowRadius = 3
        $0.layer.shadowOpacity = 1
        $0.layer.shadowColor = UIColor.systemGray4.cgColor
        $0.layer.shadowOffset = CGSize(width: 0 , height: 2)
    }
    fileprivate lazy var searchImageView = UIImageView().then {
        $0.image = UIImage(systemName: "magnifyingglass")
        $0.contentMode = .scaleAspectFit
        UIImageView.appearance().tintColor = .black
    }
    fileprivate lazy var searchBarTextFiled = UITextField().then {
        $0.placeholder = "Search By ID"
        $0.font = .systemFont(ofSize: 14)
        UITextField.appearance().tintColor = .black
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configDelegate()
        configUI()
        configAddSubview()
        configLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - self UI 세팅
extension SearchBarV {
    fileprivate func configUI() {

    }
}

// MARK: - delegate 관련
extension SearchBarV {
    fileprivate func configDelegate() {
        searchBarTextFiled.delegate = self
    }
}

// MARK: - addSubview 관련
extension SearchBarV {
    fileprivate func configAddSubview() {
        self.addSubview(searchBarSV)
        searchBarSV.addArrangedSubview(searchImageView)
        searchBarSV.addArrangedSubview(searchBarTextFiled)
    }
}

// MARK: - autoLayout 관련
extension SearchBarV {
    fileprivate func configLayout() {
        searchBarSV.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        searchImageView.snp.makeConstraints {
            $0.size.equalTo(20)
            $0.left.equalTo(searchBarSV.snp.left).offset(20)
        }
        
        searchBarTextFiled.snp.makeConstraints {
            $0.right.equalTo(searchBarSV.snp.right).offset(100)
        }
        
    }
}

// MARK: - UITextFieldDelegate 관련
extension SearchBarV: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.searchBarTextFiled.resignFirstResponder()
        
        return true
    }
}

// MARK: - override touchesBegan (키보드 내리기)
extension SearchBarV {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.searchBarTextFiled.resignFirstResponder()
    }
}

// MARK: - static 메소드 관련
extension SearchBarV {
    static func generateSearchBarView() -> UIView {
        return SearchBarV()
    }
}

// MARK: - Preview 관련
#if DEBUG

import SwiftUI

struct SearchBarV_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarV()
            .getPreview()
            .frame(width: 400, height: 60)
            .previewLayout(.sizeThatFits)
    }
}

#endif
