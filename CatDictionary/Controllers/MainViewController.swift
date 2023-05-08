//
//  ViewController.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/07.
//

import UIKit
import SnapKit
import Then

final class MainViewController: UIViewController {
    
    let searchBar = SearchBarView.generateSearchBarView()
    let catList = CatComponentsView.generateCatComponentsView()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        delegateConfig()
        uiConfig()
        addSubViewConfig()
        autolayoutConfig()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // navbar hide
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
        
        print(view.frame.size)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // navbar hide
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    } 
}

// MARK: - Self UI setting
extension MainViewController {
    fileprivate func uiConfig() {
        view.backgroundColor = .white
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        navigationController?.navigationBar.tintColor = .brown
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        title = "Explore"
    }
}

// MARK: - Delegate setting
extension MainViewController {
    fileprivate func delegateConfig() {

        
    }
}

// MARK: - AddSubview setting
extension MainViewController {
    fileprivate func addSubViewConfig() {
        view.addSubview(searchBar)
        view.addSubview(catList)
    }
}

// MARK: - AutoLayout setting
extension MainViewController {
    fileprivate func autolayoutConfig() {

        searchBar.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.height.equalTo(55)
            $0.horizontalEdges.equalToSuperview()
        }
        
        catList.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(searchBar.snp.bottom).offset(10)
            $0.width.equalToSuperview().inset(10)
            
            // 부모 뷰크기가아니라 본인의 뷰크기로 리팩토링하는 방법 찾기
            $0.height.equalTo(view.frame.width * 3/4)
        }
    }
}

// MARK: - Event handling
extension MainViewController {
    @objc fileprivate func buttonTapped() {

    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function, "path : \(indexPath)")
    }
}

// MARK: - touchesBegan endEditing
extension MainViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

// MARK: - Preview Setting
#if DEBUG

import SwiftUI

struct MainViewController_Previews: PreviewProvider {
    static var previews: some View {
        MainViewController()
            .getPreview()
            .ignoresSafeArea()
    }
}

#endif


