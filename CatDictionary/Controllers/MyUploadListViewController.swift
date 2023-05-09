//
//  MyUploadListViewController.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/07.
//

import UIKit
import PhotosUI
import Then

class MyUploadListViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var config = PHPickerConfiguration()
        config.filter = .images
        config.selection = .ordered
        config.selectionLimit = 0
        
        let picker = PHPickerViewController(configuration: config)
        
        uiConfig()

    }
}


extension MyUploadListViewController {
    fileprivate func uiConfig() {
        view.backgroundColor = .systemGray6
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        navigationController?.navigationBar.tintColor = .brown
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true
        
        title = "MyList"
    }
}

// MARK: - Preview 관련
#if DEBUG

import SwiftUI

struct MyUploadListViewController_Previews: PreviewProvider {
    static var previews: some View {
        MyUploadListViewController()
            .getPreview()
            .ignoresSafeArea()
    }
}

#endif

