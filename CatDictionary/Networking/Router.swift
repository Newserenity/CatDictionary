//
//  Router.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/13.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    case search
    case myList
    case upload
    case delete(imageId: String)
    case starList
    case category

    var baseURL: URL {
        return URL(string: API.BASE_URL)!
    }

    var method: HTTPMethod {
        switch self {
        case .search: return .get
        case .myList: return .get
        case .upload: return .post
        case .delete: return .delete
        case .starList: return .get
        case .category: return .get
        }
    }

    var endPoint: String {
        switch self {
        case .search: return "images/search?order=ASC&limit=21"
        case .myList: return "images/search?order=ASC&limit=21"
        case .upload: return "images/upload"
        case let .delete(imageId): return "images/\(imageId)"
        case .starList: return "favourites"
        case .category: return "categories"
        }
    }

    func asURLRequest() throws -> URLRequest {
        var url = baseURL.appendingPathComponent(endPoint)
        var request = URLRequest(url: url)
        request.method = method

        return request
    }
}
