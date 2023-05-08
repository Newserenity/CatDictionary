//
//  SearchBarView.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/08.
//


import UIKit
import SnapKit
import Then

final class SearchBarView: UIView {
    
    // Elements
    fileprivate lazy var topSearchBar = UIStackView().then {
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
        $0.placeholder = "キーワードで検索"
        $0.font = .systemFont(ofSize: 14)
        $0.backgroundColor = .systemGray5
        UITextField.appearance().tintColor = .black
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configDelegate()
        configUI()
        configAddSubview()
        configAutolayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    
    private func configDelegate() {
        searchBarTextFiled.delegate = self
    }
    
    private func setupUI() {
        self.backgroundColor = .systemTeal
    }
    
    private func autolayout() {
        
    }
}

// MARK: - Self UI setting
extension SearchBarView {
    fileprivate func configUI() {
        
    }
}

// MARK: - AddSubview setting
extension SearchBarView {
    fileprivate func configAddSubview() {
        self.addSubview(topSearchBar)
        topSearchBar.addArrangedSubview(searchImageView)
        topSearchBar.addArrangedSubview(searchBarTextFiled)
    }
}

// MARK: - AutoLayout setting
extension SearchBarView {
    fileprivate func configAutolayout() {
        
        
    }
}

// MARK: - Delegate setting
extension SearchBarView: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.searchBarTextFiled.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.searchBarTextFiled.resignFirstResponder()
        
        return true
    }
}

// MARK: - static 메소드 관련
extension SearchBarView {
    
    /// 서피바 만들기
    /// - Returns: 만들어진 서피바
    static func generateSearchBarView() -> UIView {
        return SearchBarView()
    }
}

// MARK: - Preview 관련
#if DEBUG

import SwiftUI

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
            .getPreview()
            .frame(width: 500, height: 100)
            .previewLayout(.sizeThatFits)
    }
}

#endif

