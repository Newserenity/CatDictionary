//
//  StarListViewController.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/07.
//

import UIKit

class StarListVC: UIViewController {

    fileprivate let starListTV = StarListTV()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configProperty()
        configLayout()
        configNavbar()
        
        networking()
    }
}

extension StarListVC {
    fileprivate func networking() {
        NetworkManager.shared.fetchStarList { res in
            self.starListTV.setStarListArr(res)
        }
    }
}

// MARK: - Setting Self
extension StarListVC {
    // self stored property
    fileprivate func configProperty() {
        self.view.backgroundColor = .white
        self.title = "Star" // navbar title
    }
}

// MARK: - autolayout 관련
extension StarListVC {
    fileprivate func configLayout() {
        self.view.addSubview(starListTV)
        
        starListTV.snp.makeConstraints {
            $0.top.bottom.equalTo(self.view.safeAreaLayoutGuide)
            $0.left.equalTo(self.view.safeAreaLayoutGuide).offset(10)
            $0.right.equalTo(self.view.safeAreaLayoutGuide).offset(-10)
        }
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

