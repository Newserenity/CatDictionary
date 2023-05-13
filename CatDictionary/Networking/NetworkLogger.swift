//
//  Logger.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/12.
//

import Foundation
import Alamofire

final class NetworkLogger: EventMonitor {
    let queue: DispatchQueue = DispatchQueue(label: "ApiLog")
    
    func requestDidResume(_ request: Request) {
        return
    }
    
    func request(_ request: DataRequest, didParseResponse response: DataResponse<Data?, AFError>) {
        
        guard let statusCode = request.response?.statusCode else { return }
    
    }
}
