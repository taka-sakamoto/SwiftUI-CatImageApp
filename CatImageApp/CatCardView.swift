//
//  CatCardView.swift
//  CatImageApp
//
//  Created by Takayuki Sakamoto on 2026/03/28.
//

import SwiftUI

struct CatCardView: View {
    let cat: Cat
    @ObservedObject var viewModel: CatViewModel
    
    @StateObject private var loader = ImageLoader()
        
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
        .frame(width: 180, height: 180) // ここ固定
        .clipped()
        .cornerRadius(12)
        .onAppear {
            loader.load(from: cat.url) // 毎回ロード
        }
        .overlay(alignment: .topTrailing) {
            Button {
                viewModel.toggleFavorite(cat)
            } label: {
                Image(systemName: viewModel.isFavorite(cat) ? "heart.fill" : "heart")
                    .foregroundColor(.red)
                    .padding(10)
                    .background(.ultraThinMaterial)
                    .clipShape(Circle())
            }
            .padding(8)
        }
    }
}

/*
#Preview {
    CatCardView()
}
*/
