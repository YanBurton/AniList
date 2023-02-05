//
//  TestView.swift
//  AniList
//
//  Created by Claudia Burton on 2022-12-07.
//

import SwiftUI

struct TestView: View {
    
    @StateObject var viewModel = AnimeViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach($viewModel.animePage.data) { anime in
                    AnimeView(anime: anime, imgUrl: anime.images.jpg.large_image_url)
                }
            }
        }
        .navigationTitle("My List")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
