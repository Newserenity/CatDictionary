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

    enum MyError : Error {
        case noContent
        case decode
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
    
    func fetchMainCatList(completion: @escaping (Result<CatExploreRes, Error>) -> Void) {
        session.request(Router.search(limit: 21)).responseDecodable(of: CatExploreRes.self) { response in
            switch response.result {
            case .success(let value):
                // 성공적인 응답 처리
                completion(.success(value))
            case .failure(let error):
                // 에러 처리
                completion(.failure(error))
            }
        }
    }
    
    // ******
    // USAGE of "fetchMainCatList"
    // ******
//    fetchMainCatList { result in
//        switch result {
//        case .success(let catExploreRes):
//            // 성공적인 응답 처리
//            print("Main Cat List 요청 성공: \(catExploreRes)")
//        case .failure(let error):
//            // 에러 처리
//            print("네트워크 요청 에러: \(error)")
//            // 에러 핸들링 로직 추가
//        }
//    }

    
    func fetchCategoty(completion: @escaping (_ : CategoryRes?, Error?)->Void) {
        session.request(Router.category)
            .responseDecodable(of: CategoryRes.self) { res in
                
                guard res.response?.statusCode == 200 else {
                    completion(nil, MyError.notAllowedStatusCode(statusCode: res.response?.statusCode ?? 00))
                    return
                }
                
            switch res.result {
            case .success(let value):
                // 성공적인 응답 처리
                completion(value, nil)
            case .failure(let error):
                // 에러 처리
                print("네트워크 요청 에러: \(error)")
                
                let myErr = MyError.unknown(err: error)
                
                completion(nil, myErr)
                // 에러 핸들링 로직 추가
            }
        }
    }
    func fetchCategoty2(completion: @escaping (_ : CategoryRes?) -> Void) {
        session.request(Router.category)
            .responseDecodable(of: CategoryRes.self) { res in
                
                
                
            switch res.result {
            case .success(let value):
                // 성공적인 응답 처리
                completion(value)
            case .failure(let error):
                // 에러 처리
                print("네트워크 요청 에러: \(error)")
                completion(nil)
                // 에러 핸들링 로직 추가
            }
        }
    }
    
    func fetchStarList(completion: @escaping (_ : StarListRes)->Void) {
        session.request(Router.starList).responseDecodable(of: StarListRes.self) { res in
            switch res.result {
            case .success(let value):
                // 성공적인 응답 처리
                completion(value)
            case .failure(let error):
                // 에러 처리
                print("네트워크 요청 에러: \(error)")
                // 에러 핸들링 로직 추가
            }
        }
    }
}
