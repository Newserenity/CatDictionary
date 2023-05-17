//
//  StarListViewController.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/07.
//

import UIKit

class StarListVC: UIViewController {

    fileprivate let myCatList = infinitCatGroupV()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        configAddSubview()
        configLayout()
        configNavbar()
        
//        NetworkManager.shared.fetchStarList { res in
//            self.myCatList.setCatsArr(res)
//        }
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
            $0.top.bottom.equalTo(self.view.safeAreaLayoutGuide)
            $0.left.equalTo(self.view.safeAreaLayoutGuide).offset(10)
            $0.right.equalTo(self.view.safeAreaLayoutGuide).offset(-10)
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
