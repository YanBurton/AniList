//
//  Anime.swift
//  AniList
//
//  Created by Claudia Burton on 2022-12-06.
//

import Foundation

struct AnimePage: Codable {
    var data = [AnimeInfo]()
}

struct AnimeInfo: Codable, Identifiable {
    // for some reason episodes and year do NOT work
    let id = UUID()
    var mal_id: Int
    var title: String
    
    //let episodes: Int
    var status: String
    var rating: String
    var score: Double
    //let year: Int
    var synopsis: String
    var genres = [Genres]()
    var images: AnimeImage
    
}

struct Genres: Codable, Identifiable {
    let id = UUID()
    var name: String
}

struct AnimeImage: Codable {
    var jpg: AnimeImageUrl
}

struct AnimeImageUrl: Codable {
    var large_image_url: String
}
