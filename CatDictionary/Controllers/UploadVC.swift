//
//  UploadViewController.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/07.
//

import UIKit
import Then
import SnapKit
import PhotosUI

class UploadVC: UIViewController {
    
    lazy var textLabel = UILabel().then {
        $0.text = "Any uploads must comply \n with the upload guidelines or face deletion."
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 13, weight: .bold)
    }
    
    lazy var imageBox = UIControl().then {
        $0.layer.borderWidth = 3
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.layer.cornerRadius = 10
    }
    
    lazy var imageView = UIImageView().then {
        $0.image = UIImage(systemName: "camera.on.rectangle")
        $0.contentMode = .scaleAspectFit
    }
    
    lazy var centerView = UIView()
    
    lazy var constructionLabel = UILabel().then {
        $0.text = "Upload a .jpg or .png cat image."
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        configNavbar()
        configAddSubview()
        configLayout()
    }
}

// MARK: - addSubview 관련
extension UploadVC {
    fileprivate func configAddSubview() {
        self.view.addSubview(centerView)
        centerView.addSubview(textLabel)
        centerView.addSubview(imageBox)
        imageBox.addSubview(imageView)
        self.view.addSubview(constructionLabel)
    }
}

// MARK: - autolayout 관련
extension UploadVC {
    fileprivate func configLayout() {
        centerView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(100)
        }
        
        textLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        imageBox.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(textLabel.snp.bottom).offset(10)
            $0.size.equalTo(self.view.bounds.width * 3/5)
        }
        
        constructionLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(40)
        }
        
        imageView.snp.makeConstraints {
            $0.edges.equalTo(imageBox.snp.edges)
        }
    }
}

// MARK: - self UI 세팅
extension UploadVC {
    fileprivate func configUI() {
        self.view.backgroundColor = .systemGray6
        self.title = "Upload" // navbar title
    }
}

// MARK: - 네비게이션바 세팅
extension UploadVC {
    fileprivate func configNavbar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        navigationController?.navigationBar.tintColor = .brown
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - preview 관련
#if DEBUG

import SwiftUI

struct UploadVC_Previews: PreviewProvider {
    static var previews: some View {
        UploadVC()
            .getPreview()
            .ignoresSafeArea()
    }
}

#endif
