//
//  ViewController.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/07.
//

import UIKit
import Then

class ExploreVC: UIViewController {
    
    fileprivate let searchBar = SearchBarV.generateSearchBarView()
    fileprivate let badgeBar = BadgeGroupV.generateBadgeComponentsView()
    fileprivate let myCatList = infinitCatGroupV.generateCatGroupV()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        configAddSubview()
        configLayout()
    }
}

// MARK: - Self UI 세팅
extension ExploreVC {
    fileprivate func configUI() {
        view.backgroundColor = .white
    }
}

// MARK: - addSubview 관련
extension ExploreVC {
    fileprivate func configAddSubview() {
        self.view.addSubview(searchBar)
        self.view.addSubview(badgeBar)
        self.view.addSubview(myCatList)
    }
}

// MARK: - autolayout 관련
extension ExploreVC {
    fileprivate func configLayout() {
        searchBar.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.left.equalToSuperview().offset(10)
            $0.right.equalToSuperview().offset(-10)
            $0.height.equalTo(50)
        }
        
        badgeBar.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(10)
            $0.right.equalToSuperview().offset(-10)
            $0.height.equalTo(50)
        }
        
        myCatList.snp.makeConstraints {
            $0.top.equalTo(badgeBar.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(10)
            $0.right.equalToSuperview().offset(-10)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}

// MARK: - 네비게이션바 세팅
extension ExploreVC {
    fileprivate func configNavbar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        navigationController?.navigationBar.tintColor = .brown
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.isHidden = true
    }
}

// MARK: - Hide Navbar
extension ExploreVC {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}


// MARK: - Preview 관련
#if DEBUG

import SwiftUI

struct ExploreVC_Previews: PreviewProvider {
    static var previews: some View {
        ExploreVC()
            .getPreview()
            .ignoresSafeArea()
    }
}

#endif



