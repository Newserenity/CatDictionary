//
//  CatModel.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/13.
//

import UIKit

struct CatExploreResData: Codable, CustomStringConvertible {
    
    let id: String?
    let imageUrl: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case imageUrl = "url"
    }
    
    var description: String {
        return "id : \(id ?? "nil") imageUrl : \(imageUrl ?? "nil")"
    }
}

typealias CatExploreRes = [CatExploreResData]
