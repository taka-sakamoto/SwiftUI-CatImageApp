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
    
    func fetchCats() async {
        
        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search?limit=10") else { return }
        
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let decoded = try JSONDecoder().decode([Cat].self, from: data)
                
                cats = decoded
                
            } catch {
                print("Error: \(error)")
            }
        }
    
}
