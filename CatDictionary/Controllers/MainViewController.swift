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
    fileprivate let catsArr = ["cat1", "cat2", "cat3", "cat4", "cat5", "cat6"]
    
    fileprivate lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init()).then {
        $0.backgroundColor = .systemGray4
    }
    
    fileprivate lazy var searchBar = SearchBarView.generateSearchBarView()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        delegateConfig()
        
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: view.frame.width/3 - 15, height: view.frame.width/3 - 15)
        collectionView.collectionViewLayout = flowLayout
        
        uiConfig()
        addSubViewConfig()
        autolayoutConfig()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // navbar hide
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
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
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // regist Cell
        collectionView.register(CatCollectionViewCell.self, forCellWithReuseIdentifier: "catCollectionViewCell")
        
    }
}

// MARK: - AddSubview setting
extension MainViewController {
    fileprivate func addSubViewConfig() {
        view.addSubview(searchBar)
        view.addSubview(collectionView)
    }
}

// MARK: - AutoLayout setting
extension MainViewController {
    fileprivate func autolayoutConfig() {
        collectionView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.right.equalToSuperview().offset(-10)
            $0.top.equalTo(searchBar.snp.bottom).offset(20)

            // 내부 컨텐츠의 크기에 맞게 리팩토링 해야함
            $0.height.equalTo(view.frame.width * 2/3)
        }
        searchBar.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.height.equalTo(55)
            $0.horizontalEdges.equalToSuperview()
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "catCollectionViewCell", for: indexPath) as! CatCollectionViewCell
        
        cell.imageView.image = UIImage(systemName: "tray.full.fill")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function, "path : \(indexPath)")
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


