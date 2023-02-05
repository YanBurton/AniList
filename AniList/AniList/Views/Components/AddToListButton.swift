//
//  AddToListButton.swift
//  AniList
//
//  Created by Claudia Burton on 2022-12-07.
//

import SwiftUI

struct AddToListButton: View {
    
    @State var showingAlert = false
    @State var anime: AnimeInfo
    
    @ObservedObject var repoViewModel = RepoViewModel()
    //@StateObject var d = Data()
    
    @EnvironmentObject var myAnimeList: AnimeViewModel
    
    var body: some View {
        Image(systemName: "plus.circle.fill")
            .font(.title)
            .foregroundColor(Color(.systemGray))
            .frame(height: 70)
            .onTapGesture {
                addToList()
                showingAlert = true
            }
            .alert("Added to List!", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }
                    }
    }
    
    func addToList() {
        let todo = Data(mal_id: anime.mal_id, title: anime.title, status: anime.status, rating: anime.rating, score: anime.score, synopsis: anime.synopsis, genres: anime.genres, images: anime.images.jpg.large_image_url)
        repoViewModel.addToDo(todo: todo)
    }
}
