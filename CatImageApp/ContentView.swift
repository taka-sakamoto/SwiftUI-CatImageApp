//
//  ContentView.swift
//  CatImageApp
//
//  Created by Takayuki Sakamoto on 2026/03/06.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CatViewModel()
    
    let columns = [
        GridItem(.fixed(180), spacing: 10),
        GridItem(.fixed(180), spacing: 10)
    ]
    
    var body: some View {
        
        TabView {
            
            // Cats画面
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(viewModel.cats, id: \.url) { cat in
                                
                            // 画像（タップで遷移）
                            NavigationLink {
                                CatDetailView(cat: cat, viewModel: viewModel)
                            } label: {
                                CatCardView(cat: cat, viewModel: viewModel)
                            }
                        }
                    
                    }
                    .padding()
                }
                .refreshable {
                    await viewModel.fetchCats()
                }
                .navigationTitle("Cats")
            }
            .onAppear {
                if viewModel.cats.isEmpty {
                    Task {
                        await viewModel.fetchCats()
                    }
                }
            }
            .tabItem {
                Label("Cats", systemImage: "photo")
            }
            
            // Favorites画面
            FavoriteView(viewModel: viewModel)
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
        }
    }
}


/*
#Preview {
    ContentView()
}
*/
