//
//  CatModel.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/13.
//  Last Modified by Jayden Jang on 2023/05/17.
//

import Foundation

struct CatExploreResData: Codable {
    
    var id: String?
    var imageUrl: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case imageUrl = "url"
    }
}

typealias CatExploreRes = [CatExploreResData]
