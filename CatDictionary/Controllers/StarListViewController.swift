//
//  StarListViewController.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/07.
//

import UIKit

class StarListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        uiConfig()
    }


}

extension StarListViewController {
    fileprivate func uiConfig() {
        view.backgroundColor = .systemGray6
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        navigationController?.navigationBar.tintColor = .brown
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        title = "Star"
    }
}

// MARK: - Preview 관련
#if DEBUG

import SwiftUI

struct StarListViewController_Previews: PreviewProvider {
    static var previews: some View {
        StarListViewController()
            .getPreview()
            .ignoresSafeArea()
    }
}

#endif
