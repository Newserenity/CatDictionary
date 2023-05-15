//
//  CatModel.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/13.
//

import Foundation

struct CatExploreResData: Codable {
    
    var id: String?
    var imageUrl: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case imageUrl = "url"
    }
    
//     READ ME
//     to use this property confirm {CustomStringConvertible} PROTOCOL
//    var description: String {
//        return "id : \(id ?? "nil") imageUrl : \(imageUrl ?? "nil")"
//    }
}

typealias CatExploreRes = [CatExploreResData]
