//
//  ContentView.swift
//  CatImageApp
//
//  Created by Takayuki Sakamoto on 2026/03/06.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = CatViewModel()
    
    var body: some View {
        
        NavigationView {
            
            if viewModel.isLoading {
                ProgressView()
            } else {
                
                List(viewModel.cats) { cat in
                    
                    AsyncImage(url: URL(string: cat.url)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 200)
                    .clipped()
                }
                refreshable {
                    await viewModel.fetchCats()
                }
            }
        }
            .navigationTitle("Cats")
            .task {
                await viewModel.fetchCats()
            }
        }
    }


/*
#Preview {
    ContentView()
}
*/
