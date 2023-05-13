//
//  CatExploreVM.swift
//  CatDictionary
//
//  Created by Jayden Jang on 2023/05/13.
//

import Foundation
import Combine
import Alamofire

class CatExploreVM: ObservableObject {
    
    var subscription = Set<AnyCancellable>()
    
    @Published var catExplore: CatExploreRes?
    
    init() {
        fetchRandomCat()
    }
    
    func fetchRandomCat() {
        NetworkManager.shared.session
            .request(Router.search(limit: 10))
            .publishDecodable(type: CatExploreRes.self)
            .compactMap{ $0.value }
            .sink { _ in
                print("데이터 스트림 완료")
            } receiveValue: { res in
                print(res)
                self.catExplore = res
            }
            .store(in: &subscription)
    }
}
