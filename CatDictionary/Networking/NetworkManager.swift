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

    static let shared = NetworkManager()
    
    let interceptors = Interceptor(interceptors: [BaseInterceptor()])
    var session: Session
    
    private init() {
        session = Session(interceptor: interceptors)
    }
    
    func fetchMainCatList(completion: @escaping (_: CatExploreRes)->Void) {
        session.request(Router.search(limit: 21)).responseDecodable(of: CatExploreRes.self) { res in
            guard let safeValue = res.value else { return }
            completion(safeValue)
        }
    }
    
    func fetchCategoty(completion: @escaping (_ : CategoryRes)->Void) {
        session.request(Router.category).responseDecodable(of: CategoryRes.self) { res in
            guard let safeValue = res.value else { return }
            completion(safeValue)
        }
    }
    
    func fetchStarList(completion: @escaping (_ : StarListRes)->Void) {
        session.request(Router.starList).responseDecodable(of: StarListRes.self) { res in
            guard let safeValue = res.value else { return }
            completion(safeValue)
        }
    }
}
