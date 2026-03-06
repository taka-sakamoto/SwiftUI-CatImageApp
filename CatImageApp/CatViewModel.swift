//
//  CatViewModel.swift
//  CatImageApp
//
//  Created by Takayuki Sakamoto on 2026/03/06.
//

import Foundation
import SwiftUI
import Combine

class CatViewModel: ObservableObject {
    
    @Published var imageUrl: String = ""
    
    func fetchCat() {
        
        guard let url = URL(string: "https:/api.thecatapi.com/v1/images/search") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            do {
                let cats = try JSONDecoder().decode([Cat].self, from: data)
                
                DispatchQueue.main.async {
                    self.imageUrl = cats.first?.url ?? ""
                }
                
            } catch {
                print(error)
            }
        } .resume()
    }
}
