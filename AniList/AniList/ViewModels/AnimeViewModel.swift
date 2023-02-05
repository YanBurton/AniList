//
//  AnimeViewModel.swift
//  AniList
//
//  Created by Claudia Burton on 2022-12-06.
//

import SwiftUI

class AnimeViewModel: ObservableObject {
    @Published var animePage = AnimePage()
    @Published var letterFilter: Letter = Letter.none
    @Published var page = 1
    
    @Published var animeList = [MyAnime]()

    let baseUrl = "https://api.jikan.moe/v4/anime?sfw=true&page="

    
    init() {
        fetchAnime()
    }
    
    func fetchAnime() {
        guard let url = URL(string: baseUrl + String(page)) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            guard let anime = try? JSONDecoder().decode(AnimePage.self, from: data) else { return }
                    DispatchQueue.main.async {
                        self.animePage = anime
                    }
        }.resume()
    }
    
    func fetchAnimeByLetter() {
        page = 1
        //if the filter is anything but none, update
        if letterFilter != Letter.none {
            guard let url = URL(string: baseUrl + "&letter=\(letterFilter)") else { return }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else { return }
                guard let anime = try? JSONDecoder().decode(AnimePage.self, from: data) else { return }
                DispatchQueue.main.async {
                    self.animePage = anime
                }
            }.resume()
        //if its actually none, go back to normal
        } else {
            guard let url = URL(string: baseUrl) else { return }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else { return }
                guard let anime = try? JSONDecoder().decode(AnimePage.self, from: data) else { return }
                        DispatchQueue.main.async {
                            self.animePage = anime
                        }
            }.resume()
        }
    }
    
    func fetchOtherPage() {
        //if there is a filter applied, continue with correct url
        if letterFilter != Letter.none {
            guard let url = URL(string: baseUrl + String(page) + "&letter=\(letterFilter)") else { return }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else { return }
                guard let anime = try? JSONDecoder().decode(AnimePage.self, from: data) else { return }
                DispatchQueue.main.async {
                    self.animePage = anime
                }
            }.resume()
        //else if there is no filter, continue
        } else {
            guard let url = URL(string: baseUrl + String(page)) else { return }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else { return }
                guard let anime = try? JSONDecoder().decode(AnimePage.self, from: data) else { return }
                DispatchQueue.main.async {
                    self.animePage = anime
                }
            }.resume()
        }
    }
}
