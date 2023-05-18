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
    
    fileprivate lazy var searchView = UIView().then {
        $0.backgroundColor = .white
        
        $0.layer.cornerRadius = 50/2
        
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
        
        configProperty()
        configLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // override touchesBegan (키보드 내리기)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.searchBarTextFiled.resignFirstResponder()
    }
}

// MARK: - delegate 관련
extension SearchBarV {
    fileprivate func configProperty() {
        searchBarTextFiled.delegate = self
    }
}

// MARK: - autoLayout 관련
extension SearchBarV {
    fileprivate func configLayout() {
        searchView.addSubview(searchImageView)
        searchView.addSubview(searchBarTextFiled)
        addSubview(searchView)
        
        searchView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        searchImageView.snp.makeConstraints {
            $0.size.equalTo(20)
            $0.left.equalTo(searchView.snp.left).offset(20)
            $0.centerY.equalToSuperview()
        }
        
        searchBarTextFiled.snp.makeConstraints {
            $0.left.equalTo(searchImageView.snp.right).offset(10)
            $0.top.bottom.equalToSuperview()
            $0.right.equalToSuperview()
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

