//
//  StarList+Res.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/17.
//

import Foundation

struct StarListResData: Codable {
    var id: Int?
    var date: String?
    var image: Image?

    private enum CodingKeys: String, CodingKey {
        case id
        case image
        case date = "created_at"
    }
}

// MARK: - Image
struct Image: Codable {
    var imageId: String?
    var imageUrl: String?

    private enum CodingKeys: String, CodingKey {
        case imageId = "id"
        case imageUrl = "url"
    }
}

typealias StarListRes = [StarListResData]
