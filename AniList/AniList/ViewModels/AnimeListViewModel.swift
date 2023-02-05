//
//  AnimeListViewModel.swift
//  AniList
//
//  Created by Claudia Burton on 2022-12-07.
//

import Foundation


class AnimeListViewModel: ObservableObject {
    @Published var animeList = [MyAnime]()
}
