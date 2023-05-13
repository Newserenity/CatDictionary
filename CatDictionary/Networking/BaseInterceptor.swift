//
//  Base.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/12.
//

import Foundation
import Alamofire

final class BaseInterceptor: RequestInterceptor {

    
    // complition 을 호출하지않으면 함수가 멈춰버림
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        print(#function)
        
        let apiKey = Bundle.main.infoDictionary?["ApiKey"] as? String ?? ""
        
        var req = urlRequest
        req.headers.add(name: "Content-Type", value: "application/json")
        req.headers.add(name: "x-api-key", value: apiKey)
        
        completion(.success(req))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        print(#function)
        completion(.doNotRetry)
    }
}
