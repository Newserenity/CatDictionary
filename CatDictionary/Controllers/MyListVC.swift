//
//  MyUploadListViewController.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/07.
//

import UIKit
import Then

class MyListVC: UIViewController {

    fileprivate let myCatList = CatGroupV()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configProperty()
        configLayout()
        configNavbar()
        
        self.view.backgroundColor = .white
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
        self.view.addSubview(myCatList)
        
        myCatList.snp.makeConstraints {
            $0.left.equalTo(self.view.safeAreaLayoutGuide).offset(10)
            $0.right.equalTo(self.view.safeAreaLayoutGuide).offset(-10)
            $0.verticalEdges.equalTo(self.view.safeAreaLayoutGuide)
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

