//
//  Env.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/11.
//

import Foundation

//MARK: - Name Space 만들기


// 사용하게될 API 문자열 묶음
public enum Api {
    static let endPointURL = "https://api.thecatapi.com/v1/"
    static let imageSearch = "images/search/"
}

// Cell identifier
public enum Identifier {
    static let catCVCell = "catCVCell"
    static let badgeTVCell = "badgeTVCell"
}
