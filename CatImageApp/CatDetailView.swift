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
        AsyncImage(url: URL(string: cat.url)) { Image in
            Image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .navigationTitle("Cat")
    }
}

/*
#Preview {
    CatDetailView()
}
*/
