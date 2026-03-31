//
//  FavoriteManager.swift
//  CatImageApp
//
//  Created by Takayuki Sakamoto on 2026/03/27.
//

import Foundation

class FavoriteManager {
    
    private let key = "favorite_cats"
    
    func fetch() -> [Cat] {
        guard let data = UserDefaults.standard.data(forKey: key),
              let decoded = try? JSONDecoder().decode([Cat].self, from: data) else {
            return []
        }
        return decoded
    }
    
    func save(_ cat: Cat) {
        var favorites = fetch()
        
        // 重複チェック
        if !favorites.contains(where: { $0.id == cat.id }) {
            favorites.append(cat)
            store(favorites)
        }
    }
    
    func remove(_ cat: Cat) {
        var favorites = fetch()
        favorites.removeAll (where: { $0.id == cat.id })
        store(favorites)
    }
    

    
    private func store(_ cats: [Cat]) {
        if let encoded = try? JSONEncoder().encode(cats) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
    /*
    struct Cat: Identifiable, Codable {
        let id: String
        let url: String
    }
     */
}
