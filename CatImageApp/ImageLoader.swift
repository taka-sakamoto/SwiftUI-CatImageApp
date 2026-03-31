//
//  ImageLoader.swift
//  CatImageApp
//
//  Created by Takayuki Sakamoto on 2026/03/29.
//

import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    func load(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data, let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = uiImage
                }
            }
        }.resume()
    }
}

/*
#Preview {
    ImageLoader()
}
*/
