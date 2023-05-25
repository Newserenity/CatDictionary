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
    fileprivate let myCatList = CatGroupV()
    
    // Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configProperty()
        configLayout()
        
        configNavbar() // This Func come from  "~/extentions/UIVC+EXT"
        
        initNetworking()
        
        showErrorAlert(err: NetworkManager.NetworkErr.notAllowedStatusCode(statusCode: 404))
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

//MARK: - Helpers
extension ExploreVC {
    
    fileprivate func handleErr(_ err: Error){
        if let safeErr = err as? NetworkManager.NetworkErr {
            switch safeErr {
            case .notAllowedStatusCode(let statusCode):
                print(#fileID, #function, #line, "- statusCode: \(statusCode)")
            case .unknown(let err):
                showErrorAlert(err: err)
            }
        }
    }
    
    fileprivate func showErrorAlert(err: Error){
        
        let errMsg = err as? NetworkManager.NetworkErr
        
        let alert = UIAlertController(title: "안내", message: errMsg?.info, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Networking Err", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
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
        
        NetworkManager.shared.fetchMainCatList { res, err in
            if let safeRes = res {
                self.myCatList.setCatsArr(safeRes)
            }
            
            if let safeErr = err {
                print(#fileID, #function, #line, "- \(safeErr)")
            }
        }
        
        // fetching categoty menu
//        NetworkManager.shared.fetchCategoty { res in
//            self.badgeBar.setCategoryArr(res)
//        }
        
        NetworkManager.shared.fetchCategoty(completion: { [weak self] res, err in
            guard let self = self else { return }
            if let err = err  {
                print(#fileID, #function, #line, "- 에러발생 : \(err)")
                self.handleErr(err)
                return
            }
            guard let res = res else { return }
            self.badgeBar.setCategoryArr(res)
        })
        
    }
}

// MARK: - addSubview / autolayout
extension ExploreVC {    
    fileprivate func configLayout() {
        self.view.addSubview(searchBar)
        self.view.addSubview(badgeBar)
        self.view.addSubview(myCatList)
        
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



