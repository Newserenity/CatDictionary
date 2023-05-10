//
//  MyUploadListViewController.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/07.
//

import UIKit
import PhotosUI
import Then

class MyListVC: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        configNavbar()
    }
}

// MARK: - Self UI 세팅
extension MyListVC {
    fileprivate func configUI() {
        view.backgroundColor = .systemGray6
        title = "MyList" // navbar title
    }
}

// MARK: - 네비게이션바 세팅
extension MyListVC {
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

// MARK: - Preview 관련
#if DEBUG

import SwiftUI

struct MyListVC_Previews: PreviewProvider {
    static var previews: some View {
        MyListVC()
            .getPreview()
            .ignoresSafeArea()
    }
}

#endif

