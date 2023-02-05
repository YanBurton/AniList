//
//  MyListView.swift
//  AniList
//
//  Created by Claudia Burton on 2022-12-07.
//

/*
import SwiftUI

struct AnimeList: View {
    @ObservedObject var viewModel = RepoViewModel()
    @StateObject var d = Data()
    @State var title = ""
    
    var body: some View {
        
        VStack {
            List(viewModel.toDoList) { item in
                HStack{
                    HStack (spacing: 40){
                        Text("Title: \(item.title)")
                        Spacer()
                    }
                    //.accessibilityIdentifier("Player")
                    HStack{
                        Button(action: {
                            title = item.title
                            viewModel.toBeUpdatedToDo = item
                        }, label: {
                            Image(systemName: "pencil")
                        })
                        
                        
                        Button(action: {
                            viewModel.deleteToDo(todo: item)
                        }, label: {
                            Image(systemName: "trash")
                        })
                        
                    }
                    
                }
                
            }
            
            VStack(alignment: .center){
                HStack(alignment: .center){
                    TextField("Enter your Title", text: $title)
                    
                }
                Spacer()
                HStack(alignment: .center){
                    Button( action: {
                        let todo = Data(mal_id: 1, title: title, status: "smt", rating: "smt", score: 9.0, synopsis: "synopsis", genres: [Genres(name: "genre 1"), Genres(name: "genre 2")], images: "img.url", my_score: 8.6, my_comment: "no comment")
                        viewModel.addToDo(todo: todo)
                        
                        
                    }, label: {
                        Text("Add Title")
                        
                    })
                    //.accessibilityIdentifier("SubmitTeam")
                    
                }
            }
        }
    }
}*/




import SwiftUI

struct MyListView: View {
    
    @ObservedObject var repoViewModel = RepoViewModel()
    //@StateObject var d = Data()
    
    @EnvironmentObject var viewModel: AnimeViewModel
    
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(repoViewModel.toDoList) { anime in
                    AnimeListView(anime: MyAnime(info: AnimeInfo(mal_id: anime.mal_id, title: anime.title, status: anime.status, rating: anime.rating, score: anime.score, synopsis: anime.synopsis, images: AnimeImage(jpg: AnimeImageUrl(large_image_url: anime.images))), my_score: anime.my_score, my_comment: anime.my_comment), imgUrl: anime.images)
                }
            }
        }
        .navigationTitle("My List")
        .navigationBarTitleDisplayMode(.inline)
    }
}
