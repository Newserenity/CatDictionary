//
//  MyUploadListViewController.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/07.
//

import UIKit
import Then

class MyListVC: UIViewController {

    fileprivate let myCatList = infinitCatGroupV()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        configAddSubview()
        configLayout()
        configNavbar()
        
        self.view.backgroundColor = .white
    }
}

// MARK: - Self UI 세팅
extension MyListVC {
    fileprivate func configUI() {
        title = "MyList"
    }
}

// MARK: - addSubview 관련
extension MyListVC {
    fileprivate func configAddSubview() {
        self.view.addSubview(myCatList)
    }
}

// MARK: - autolayout 관련
extension MyListVC {
    fileprivate func configLayout() {
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

