//
//  AnimeList.swift
//  AniList
//
//  Created by Claudia Burton on 2022-12-07.
//

import Foundation

struct MyAnime: Identifiable, Codable {
    let id = UUID()
    var info: AnimeInfo
    var my_score: Double?
    var my_comment: String?
}
