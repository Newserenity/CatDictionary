//
//  ViewController.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/07.
//

import UIKit
import SnapKit
import Then
import Fakery

final class ExploreVC: UIViewController {
    
    let searchBar = SearchBarView.generateSearchBarView()
    let badgeBar = BadgeComponentsView.generateBadgeComponentsView()
    let catList = CatComponentsView.generateCatComponentsView()
    let catList2 = CatComponentsView.generateCatComponentsView()
    let catList3 = CatComponentsView.generateCatComponentsView()
    
    let scrollView = UIScrollView().then {
        $0.isUserInteractionEnabled = true
        $0.alwaysBounceVertical = true
    }
    let containerView = UIView().then {
        $0.backgroundColor = .white
    }
    
    let contentLabel = UIView()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        configDelegate()
        configUI()
        configNavbar()
        configAddSubview()
        configLayout()
    }
}

// MARK: - self UI 세팅
extension ExploreVC {
    fileprivate func configUI() {
        view.backgroundColor = .white
        title = "Explore" // navber title
    }
}

// MARK: - 네비게이션바 세팅
extension ExploreVC {
    fileprivate func configNavbar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        navigationController?.navigationBar.tintColor = .brown
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - delegate setting
extension ExploreVC {
    fileprivate func configDelegate() {

        
    }
}

// MARK: - addSubview 관련
extension ExploreVC {
    fileprivate func configAddSubview() {
        self.view.addSubview(searchBar)
        self.view.addSubview(badgeBar)
        self.view.addSubview(scrollView)
        
        scrollView.addSubview(containerView)

        containerView.addSubview(catList)
        containerView.addSubview(catList2)
        containerView.addSubview(catList3)

    }
}

// MARK: - autolayout 관련
extension ExploreVC {
    fileprivate func configLayout() {
        searchBar.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.height.equalTo(55)
            $0.horizontalEdges.equalToSuperview()
        }
        
        badgeBar.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(15)
            $0.height.equalTo(30)
            $0.horizontalEdges.equalToSuperview().offset(10)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(badgeBar.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        containerView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide.snp.edges)
            $0.width.equalTo(scrollView.frameLayoutGuide.snp.width).multipliedBy(1)
        }
        
        catList.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview()
            $0.width.equalToSuperview().inset(10)
            $0.height.equalTo(view.frame.width * 3/4)
        }

        catList2.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(catList.snp.bottom).offset(10)
            $0.width.equalToSuperview().inset(10)
            $0.height.equalTo(view.frame.width * 3/4)
        }

        catList3.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(catList2.snp.bottom).offset(10)
            $0.width.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(20)
            $0.height.equalTo(view.frame.width * 3/4)
        }
    }
}

// MARK: - Event handling 관련
extension ExploreVC {
    @objc fileprivate func buttonTapped() {

    }
}

// MARK: - CollectionView Delegate 관련
extension ExploreVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function, "path : \(indexPath)")
    }
}

// MARK: - override touchesBegan (키보드 내리기)
extension ExploreVC {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

// MARK: - override viewWillAppear, viewWillDisappear (navbar 숨기기)
extension ExploreVC {
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


