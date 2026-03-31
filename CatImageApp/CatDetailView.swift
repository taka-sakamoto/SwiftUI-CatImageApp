//
//  CatDetailView.swift
//  CatImageApp
//
//  Created by Takayuki Sakamoto on 2026/03/07.
//

import SwiftUI

struct CatDetailView: View {
 
    let cat: Cat
    @ObservedObject var viewModel: CatViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
                
            AsyncImage(url: URL(string: cat.url)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(maxHeight: 400)
                
            Button(action: {
                let wasFavorite = viewModel.isFavorite(cat)
                
                viewModel.toggleFavorite(cat)
                
                if wasFavorite {
                    dismiss()
                }
            }) {
                Image(systemName: viewModel.isFavorite(cat) ? "heart.fill" : "heart")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.red)
            }
            .padding()
            
            if let url = URL(string: cat.url) {
                ShareLink(item: url) {
                    Label("Share", systemImage: "square.and.arrow.up")
                }
                .padding()
                
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Cat")
    }
}

/*
#Preview {
    CatDetailView()
}
*/
