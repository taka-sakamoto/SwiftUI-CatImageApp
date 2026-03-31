//
//  CatViewModel.swift
//  CatImageApp
//
//  Created by Takayuki Sakamoto on 2026/03/06.
//

import Foundation
import SwiftUI
import Combine

@MainActor
class CatViewModel: ObservableObject {
    
    @Published var cats: [Cat] = []
    @Published var isLoading = false
    @Published var favorites: [Cat] = []

    private let favoritesKey = "favoriteCats"
    
    init() {
        loadFavorites()
    }
 
    // APIから猫画像を取得
    func fetchCats() async {
  
    
        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search?limit=10&api_key=YOUR_REAL_KEY") else { return }
     
        
        print("fetch start")
        // isLoading = true
        // defer { isLoading = false }
        
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let decoded = try JSONDecoder().decode([Cat].self, from: data)
                
                cats = []
                cats = decoded
                
                print("fetch success")
                
                
            } catch {
                let nsError = error as NSError
                if nsError.code != -999{
                    print("Error: \(error)")
                } else {
                    print("cancelled")
                }
            }
    }

    // 永続化されたお気に入りを読み込む
    func loadFavorites() {
        if let data = UserDefaults.standard.data(forKey: favoritesKey),
            let saved = try? JSONDecoder().decode([Cat].self, from: data) {
                favorites = saved
        }
    }
    
    // お気に入り追加／削除
    func toggleFavorite(_ cat: Cat) {
        if let index = favorites.firstIndex(where: { $0.id == cat.id }) {
            favorites.remove(at: index)
        } else {
            // 重複防止
            if !favorites.contains(where: { $0.url == cat.url}) {
                favorites.append(cat)
            }
        }
        saveFavorites()
    }
    
    // 永続化
    private func saveFavorites() {
        if let data = try? JSONEncoder().encode(favorites) {
            UserDefaults.standard.set(data, forKey: favoritesKey)
        }
    }
    
    func isFavorite(_ cat: Cat) -> Bool {
        favorites.contains(where: { $0.id == cat.id })
    }

}
