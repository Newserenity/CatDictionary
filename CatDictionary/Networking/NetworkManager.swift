//
//  NetworkManager.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/12.
//

import Foundation
import Alamofire

//MARK: - Networking
final class NetworkManager {

    // 여러화면에서 통신을 한다면, 일반적으로 싱글톤으로 만듦
    static let shared = NetworkManager()
    
    let interceptors = Interceptor(interceptors: [BaseInterceptor()])
    var session: Session
    
    private init() {
        session = Session(interceptor: interceptors)
    }
    
    func fetchMainCatList(completion: @escaping ()->Void) {
        session.request(Router.search(limit: 21)).responseDecodable(of: CatExploreRes.self, completionHandler: { res in
            print(res.description)
        })
        completion()
    }
}
