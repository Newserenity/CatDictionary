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

    enum NetworkErr : Error {
        case notAllowedStatusCode(statusCode: Int)
        case unknown(err : Error)
        
        var info : String {
            switch self {
            case .notAllowedStatusCode(let code):
                return "허용되지 않는 상태코드 입니다 : \(code)"
            default: return self.localizedDescription
            }
        }
    }
    
    static let shared = NetworkManager()
    
    let interceptors = Interceptor(interceptors: [BaseInterceptor()])
    var session: Session
    
    private init() {
        session = Session(interceptor: interceptors)
    }
    
    func fetchMainCatList(completion: @escaping (_ : CatExploreRes?, Error?) -> Void) {
        session.request(Router.search(limit: 21))
            .responseDecodable(of: CatExploreRes.self) { res in
                
                // 상태코드가 200이 아닐경우 에러처리
                guard res.response?.statusCode == 200 else {
                    completion(nil, NetworkErr.notAllowedStatusCode(statusCode: res.response?.statusCode ?? 00))
                    return
                }
                switch res.result {
                case .success(let value):
                    // 성공적인 응답 처리
                    completion(value, nil)
                case .failure(let error):
                    // 에러 처리
                    let err = NetworkErr.unknown(err: error)
                    completion(nil, err)
                }
        }
    }
    
    func fetchCategoty(completion: @escaping (_ : CategoryRes?, Error?) -> Void) {
        session.request(Router.category)
            .responseDecodable(of: CategoryRes.self) { res in
            
                // 상태코드가 200이 아닐경우 에러처리
                guard res.response?.statusCode == 200 else {
                    completion(nil, NetworkErr.notAllowedStatusCode(statusCode: res.response?.statusCode ?? 00))
                    return
                }
                
                // Result 분기처리
                switch res.result {
                case .success(let value):
                    // 성공적인 응답 처리
                    completion(value, nil)
                case .failure(let error):
                    // 에러 처리
                    let err = NetworkErr.unknown(err: error)
                    completion(nil, err)
                }
        }
    }
    
    func fetchStarList(completion: @escaping (_ : StarListRes?, Error?) -> Void) {
        session.request(Router.starList)
            .responseDecodable(of: StarListRes.self) { res in
                
                // 상태코드가 200이 아닐경우 에러처리
                guard res.response?.statusCode == 200 else {
                    completion(nil, NetworkErr.notAllowedStatusCode(statusCode: res.response?.statusCode ?? 00))
                    return
                }
                
                // Result 분기처리
                switch res.result {
                case .success(let value):
                    // 성공적인 응답 처리
                    completion(value, nil)
                case .failure(let error):
                    // 에러 처리
                    let err = NetworkErr.unknown(err: error)
                    completion(nil, err)
                }
        }
    }
}
