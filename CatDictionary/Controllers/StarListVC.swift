//
//  StarListViewController.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/07.
//

import UIKit

class StarListVC: UIViewController {

    fileprivate let myCatList = infinitCatGroupV.generateCatGroupV()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        configAddSubview()
        configLayout()
    }
}

// MARK: - addSubview 관련
extension StarListVC {
    fileprivate func configAddSubview() {
        self.view.addSubview(myCatList)
    }
}

// MARK: - autolayout 관련
extension StarListVC {
    fileprivate func configLayout() {
        myCatList.snp.makeConstraints {
            $0.left.equalTo(self.view.safeAreaLayoutGuide).offset(10)
            $0.right.equalTo(self.view.safeAreaLayoutGuide).offset(-10)
            $0.verticalEdges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}

// MARK: - Self UI 세팅
extension StarListVC {
    fileprivate func configUI() {
        self.view.backgroundColor = .white
        self.title = "Star" // navbar title
    }
}

// MARK: - 네비게이션바 세팅
extension StarListVC {
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

struct StarListVC_Previews: PreviewProvider {
    static var previews: some View {
        StarListVC()
            .getPreview()
            .ignoresSafeArea()
    }
}

#endif
