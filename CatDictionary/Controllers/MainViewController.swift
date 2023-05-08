//
//  ViewController.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/07.
//

import UIKit
import SnapKit
import Then

class MainViewController: UIViewController {
    let catsArr = ["cat1", "cat2", "cat3", "cat4", "cat5", ]
    
    var collectionView = UICollectionView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        uiConfig()
        addSubViewConfig()
        autolayoutConfig()
        
    }
}

// MARK: - Self UI setting
extension MainViewController {
    fileprivate func uiConfig() {
        view.backgroundColor = .systemGray6
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        navigationController?.navigationBar.tintColor = .brown
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        title = "Main"
    }
}

// MARK: - Delegate setting
extension MainViewController {
    fileprivate func delegateConfig() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
}

// MARK: - AddSubview setting
extension MainViewController {
    fileprivate func addSubViewConfig() {
        view.addSubview(collectionView)
    }
}

// MARK: - AutoLayout setting
extension MainViewController {
    fileprivate func autolayoutConfig() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
   
    }
}

// MARK: - Event handling
extension MainViewController {
    @objc fileprivate func tempButtonTapped() {
        print(#function)
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // 컬렉션뷰에 몇개의 데이터를 표시할 것인지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catsArr.count
    }
    
    // 셀의 구성(셀에 표시하고자 하는 데이터 표시)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
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


