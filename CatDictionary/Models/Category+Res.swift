//
//  Category+Res.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/15.
//

import Foundation

struct CategoryResData: Codable {
    
    var id: Int?
    var categoryName: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case categoryName = "name"
    }
}

typealias CategoryRes = [CategoryResData]
