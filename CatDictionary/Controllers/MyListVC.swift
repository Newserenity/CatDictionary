//
//  MyUploadListViewController.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/07.
//

import UIKit
import Then

class MyListVC: UIViewController {

    fileprivate let myListTV = StarListTV()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configProperty()
        configLayout()
        configNavbar()
        
//        networking()
    }
}

// MARK: - Setting Self
extension MyListVC {
    // self stored property
    fileprivate func configProperty() {
        self.title = "MyList"
        self.view.backgroundColor = .white
    }
}


// MARK: - autolayout 관련
extension MyListVC {
    fileprivate func configLayout() {
        self.view.addSubview(myListTV)
        
        myListTV.snp.makeConstraints {
            $0.top.bottom.equalTo(self.view.safeAreaLayoutGuide)
            $0.left.equalTo(self.view.safeAreaLayoutGuide).offset(10)
            $0.right.equalTo(self.view.safeAreaLayoutGuide).offset(-10)
        }
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

