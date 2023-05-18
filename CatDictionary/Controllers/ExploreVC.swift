//
//  ViewController.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/07.
//

import UIKit
import Then
import SnapKit

class ExploreVC: UIViewController {
    //test
    fileprivate let searchBar = SearchBarV()
    fileprivate let badgeBar = BadgeGroupV()
    fileprivate let myCatList = infinitCatGroupV()
    
    // Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configProperty()
        configAddSubview()
        configLayout()
        
        configNavbar() // This Func come from  "~/extentions/UIVC+EXT"
        
        initNetworking()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // navbar hide setting
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // navbar hide setting
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

// MARK: - Setting Self
extension ExploreVC {
    // self stored property
    fileprivate func configProperty() {
        self.view.backgroundColor = .white
    }
}

// MARK: - Networing
extension ExploreVC {
    fileprivate func initNetworking() {
        // fetching main catlist
        NetworkManager.shared.fetchMainCatList { res in
            self.myCatList.setCatsArr(res)
        }
        
        // fetching categoty menu
        NetworkManager.shared.fetchCategoty { res in
            self.badgeBar.setCategoryArr(res)
        }
    }
}

// MARK: - addSubview / autolayout
extension ExploreVC {
    fileprivate func configAddSubview() {
        self.view.addSubview(searchBar)
        self.view.addSubview(badgeBar)
        self.view.addSubview(myCatList)
    }
    
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



