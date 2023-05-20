//
//  RxTestVC.swift
//  CatDictionary
//
//  Created by Jeff Jeong on 2023/05/20.
//

import Foundation
import UIKit
import SnapKit
import Then
import RxSwift

class RxTestVC: UIViewController {
    
    var tapEventSubject: PublishSubject<Void> = PublishSubject()
    
    private var config = UIButton.Configuration.filled()
    fileprivate lazy var testBtn = UIButton().then {
        $0.addTarget(self, action: #selector(btnPressed), for: .touchUpInside)
        $0.configuration = .filled()
        config.title = "Select"
        config.baseBackgroundColor = .systemTeal
        config.cornerStyle = .capsule
        config.titlePadding = 10
        $0.configuration = self.config
    }
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .white
        self.configLayout()
    }
    
    var tabEventdis: Disposable? = nil
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#fileID, #function, #line, "- ")
        tabEventdis = tapEventSubject
            .debug("Tapevent subject")
            .subscribe {
            print(#fileID, #function, #line, "- ")
        } onError: { err in
            print(#fileID, #function, #line, "- ")
        } onCompleted: {
            print(#fileID, #function, #line, "- ")
        } onDisposed: {
            print(#fileID, #function, #line, "- ")
        }

        
        let myJust = { (element: Int) -> Observable<Int> in
            return Observable.create { observer in

                observer.on(.next(element))
                observer.on(.next(element))
//                observer.onError()
                observer.on(.error(NetworkManager.MyError.noContent))

                observer.on(.next(element))
                observer.on(.completed)
                return Disposables.create()
            }
        }

        myJust(333) // Observable<String>
            .skip(1)
            .debug("myJust")
            .map{ (value : Int) -> String in
                return "하하하 : \(value)"
            } // Observable<String>
            .subscribe { print($0) }
            .disposed(by: disposeBag)
        
        
    }
    
    @objc fileprivate func btnPressed(_ sender: UIButton) {
        print(#fileID, #function, #line, "- ")
        
        tapEventSubject.on(.next(()))
        

      
        
    }
    
    fileprivate func configLayout() {
        
        self.view.addSubview(testBtn)
        
        testBtn.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
    }
    
}

// MARK: - Preview 관련
#if DEBUG

import SwiftUI

struct RxTestVC_Previews: PreviewProvider {
    static var previews: some View {
        RxTestVC()
            .getPreview()
            .ignoresSafeArea()
    }
}

#endif

