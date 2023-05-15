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
    
    fileprivate let searchBar = SearchBarV()
    fileprivate let badgeBar = BadgeGroupV()
    fileprivate let myCatList = infinitCatGroupV()
    
    // Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configAddSubview()
        configLayout()
        configNavbar()
        
        self.view.backgroundColor = .white
        
        NetworkManager.shared.fetchMainCatList { res in
            self.myCatList.setCatsArr(res)
        }
        
        NetworkManager.shared.fetchCategoty { res in
            self.badgeBar.setCategoryArr(res)
        }
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



