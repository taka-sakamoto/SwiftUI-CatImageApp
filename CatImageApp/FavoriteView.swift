//
//  FavoriteView.swift
//  CatImageApp
//
//  Created by Takayuki Sakamoto on 2026/03/27.
//

import SwiftUI

struct FavoriteView: View {
    @ObservedObject var viewModel: CatViewModel
    
    let columns = [
        GridItem(.fixed(180), spacing: 10),
        GridItem(.fixed(180), spacing: 10)
    ]
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.favorites.isEmpty {
                    Text("お気に入りがありません")
                        .foregroundColor(.gray)
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(viewModel.favorites, id: \.url) { cat in
                            
                                NavigationLink {
                                    CatDetailView(cat: cat, viewModel: viewModel)
                                } label: {
                                    CatCardView(cat: cat, viewModel: viewModel)
                                        .id(cat.url)
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Favorites")
        }
        
    }
}

/*
#Preview {
    FavoriteView()
}
*/
