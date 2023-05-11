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
    
    fileprivate lazy var textLabel = UILabel().then {
        $0.text = "Any uploads must comply \n with the upload guidelines or face deletion."
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 13, weight: .bold)
    }
    fileprivate lazy var imageView = UIImageView().then {
        $0.backgroundColor = .white
        $0.image = UIImage(systemName: "camera.on.rectangle")
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 10
    }
    fileprivate lazy var centerView = UIView()
    fileprivate lazy var constructionLabel = UILabel().then {
        $0.text = "Upload a .jpg or .png cat image."
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    }
    private var config = UIButton.Configuration.filled()
    fileprivate lazy var button = UIButton().then {
        $0.addTarget(self, action: #selector(btnPressed), for: .touchUpInside)
        $0.configuration = .filled()
        config.title = "Select"
        config.baseBackgroundColor = .systemTeal
        config.cornerStyle = .capsule
        config.titlePadding = 10
        $0.configuration = self.config
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        configNavbar()
        configAddSubview()
        configLayout()
    }
}

extension UploadVC: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any])
    {
        imageView.image = (info[.originalImage] as? UIImage)
        picker.dismiss(animated: true, completion: nil)
    }
}


// MARK: - event handler
extension UploadVC {
    @objc fileprivate func btnPressed() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
}

// MARK: - addSubview 관련
extension UploadVC {
    fileprivate func configAddSubview() {
        self.view.addSubview(centerView)
        self.view.addSubview(constructionLabel)
        self.view.addSubview(button)
        centerView.addSubview(textLabel)
        centerView.addSubview(imageView)
        
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
        
        imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(textLabel.snp.bottom).offset(10)
            $0.size.equalTo(self.view.bounds.width * 3/5)
        }
        
        constructionLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(40)
        }
        
        button.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(constructionLabel.snp.top).offset(-30)
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
