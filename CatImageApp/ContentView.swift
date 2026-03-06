//
//  ContentView.swift
//  CatImageApp
//
//  Created by Takayuki Sakamoto on 2026/03/06.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = CatViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            // タイトル
            Text("Cat Image App")
                .font(.title)
            
            if let url = URL(string: vm.imageUrl) {
                AsyncImage(url: url) { image in
                    image
                    .resizable()
                    .scaledToFit()
                } placeholder: {
                    // 読み込み中
                    ProgressView("Loading...")
                }
                .frame(height: 300)
            }
            Button("猫画像取得") {
                vm.fetchCat()
            }
        }
        .padding()
        .onAppear {
            vm.fetchCat()
        }
    }
}

#Preview {
    ContentView()
}
