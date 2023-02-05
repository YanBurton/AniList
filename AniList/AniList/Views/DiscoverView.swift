//
//  DiscoverView.swift
//  AniList
//
//  Created by Claudia Burton on 2022-12-07.
//

import SwiftUI

struct DiscoverView: View {
    
    @EnvironmentObject var viewModel: AnimeViewModel
    
    var body: some View {
            ScrollView {
                Picker("Letter Filter", selection: $viewModel.letterFilter){
                    ForEach(Letter.allCases, id: \.self) { value in
                        Text(value.rawValue.capitalized).tag(value)
                    }
                }.pickerStyle(.menu)
                    .background(Color(.systemGray6))
                    .onChange(of: viewModel.letterFilter) { letter in
                        viewModel.fetchAnimeByLetter()
                    }
                LazyVStack {
                    ForEach(viewModel.animePage.data, id: \.id) { anime in
                        AnimeView(anime: anime, imgUrl: anime.images.jpg.large_image_url)
                    }
                }
            }
        .navigationTitle("Discover")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                PreviousButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NextButton()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
}
