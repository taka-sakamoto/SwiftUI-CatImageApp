//
//  CustomAsyncImage.swift
//  CatImageApp
//
//  Created by Takayuki Sakamoto on 2026/03/29.
//

import SwiftUI

struct CustomAsyncImage: View {
    @StateObject private var loader = ImageLoader()
    let url: String
    
    var body: some View {
        ZStack {
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
            } else {
                ProgressView()
            }
        }
        .clipped()
        .onAppear {
            loader.load(from: url)
        }
    }
}

/*
#Preview {
    CustomAsyncImage()
}
*/
