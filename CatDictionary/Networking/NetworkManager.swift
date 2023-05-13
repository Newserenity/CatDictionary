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
    
    // 인터셉터
    let interceptors = Interceptor(interceptors: [BaseInterceptor()])
    // 로거
    let monitors = [NetworkLogger()] as [EventMonitor]
    var session: Session
    
    private init() {
        session = Session(interceptor: interceptors, eventMonitors: monitors)
    }
    

    func fetchMainCatList(completion: @escaping ()->Void) {
        session.request(
            API.BASE_URL + API.IMAGE_SEARCH,
            method: .get)
            .responseJSON { res in
                debugPrint(res)
            }
        completion()
    }
}
