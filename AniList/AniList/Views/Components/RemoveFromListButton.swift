//
//  RemoveFromListButton.swift
//  AniList
//
//  Created by Claudia Burton on 2022-12-08.
//

import SwiftUI
import Firebase

struct RemoveFromListButton: View {
    
    @State var showingAlert = false
    @State var anime: AnimeInfo
    
    @ObservedObject var repoViewModel = RepoViewModel()
    @StateObject var d = Data()

    //@EnvironmentObject var myAnimeList: AnimeViewModel

    
    var body: some View {
        Image(systemName: "minus.circle.fill")
            .font(.title)
            .foregroundColor(Color(.systemGray))
            .frame(height: 70)
            .onTapGesture {
                removeFromList()
                showingAlert = true
            }
            .alert("Removed from List!", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }
                    }
    }
    
    func removeFromList() {
        var documentId: String = "nil"
        
        for item in repoViewModel.toDoList{
            if item.mal_id == anime.mal_id {
                documentId = item.id!
            }
        }
        repoViewModel.deleteToDo(docId: documentId)
    }
}
