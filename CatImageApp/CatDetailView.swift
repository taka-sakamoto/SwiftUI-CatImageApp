//
//  CatDetailView.swift
//  CatImageApp
//
//  Created by Takayuki Sakamoto on 2026/03/07.
//

import SwiftUI

struct CatDetailView: View {
 
    let cat: Cat
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
            
            if let url = URL(string: cat.url) {
                ShareLink(item: url) {
                    Label("Share", systemImage: "square.and.arrow.up")
                }
                
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
