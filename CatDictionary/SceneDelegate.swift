//
//  SceneDelegate.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/07.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        

//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        window = UIWindow(frame: UIScreen.main.bounds)
//        // 처음보일 view controller
//        let viewController = MainViewController()
//        // 위 VC를 첫 화면으로 띄우기
//        window?.rootViewController = viewController
//        // 화면에 보이게끔 하기
//        window?.makeKeyAndVisible()
//        window?.windowScene = windowScene
        
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)

        // 탭바컨트롤러의 생성
        let tabBarController = UITabBarController()

        // 첫번째 화면은 네비게이션컨트롤러로 만들기 (기본루트뷰 설정)
        let mainViewController = UINavigationController(rootViewController: MainViewController())
        let uploadViewController = UINavigationController(rootViewController: UploadViewController())
        let myUploadListViewController = UINavigationController(rootViewController: MyUploadListViewController())
        let starListViewController = UINavigationController(rootViewController: StarListViewController())

        // 탭바 이름들 설정
        mainViewController.title = "Main"
        uploadViewController.title = "Upload"
        myUploadListViewController.title = "MyList"
        starListViewController.title = "Star"

        // 탭바로 사용하기 위한 뷰 컨트롤러들 설정
        tabBarController.setViewControllers([
            mainViewController,
            uploadViewController,
            myUploadListViewController,
            starListViewController
        ], animated: false)
        tabBarController.modalPresentationStyle = .fullScreen
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.tintColor = .systemTeal
        
        tabBarController.tabBar.layer.borderWidth = 0.3
        tabBarController.tabBar.layer.borderColor = UIColor.lightGray.cgColor

        // 탭바 이미지 설정 (이미지는 애플이 제공하는 것으로 사용)
        guard let items = tabBarController.tabBar.items else { return }
        items[0].image = UIImage(systemName: "magnifyingglass")
        items[1].image = UIImage(systemName: "camera.fill")
        items[2].image = UIImage(systemName: "checklist.unchecked")
        items[3].image = UIImage(systemName: "star.fill")

        // 기본루트뷰를 탭바컨트롤러로 설정
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

