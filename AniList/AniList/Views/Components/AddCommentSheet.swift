//
//  AddCommentView.swift
//  AniList
//
//  Created by Claudia Burton on 2022-12-08.
//

import SwiftUI

struct AddCommentSheet: View {
    @Environment(\.dismiss) var dismiss
    @State var anime: MyAnime
    @State var comment: String = ""
    //@State var score: Double = 0
    @ObservedObject var repoViewModel = RepoViewModel()
    @State private var rating1 = 0.0
    
    var body: some View {
        
        Form {
            Section {
                Text("Rating")
                ZStack {
                    Color(red: 255/255, green: 255/255, blue: 255/255)
                        .edgesIgnoringSafeArea(.all)
                    VStack(spacing:40) {
                        VStack(spacing: 0) {
                            Text("Star Rating = \(rating1, specifier: "%.1F") out of 10")
                            StarRatingView(value: $rating1, stars: 10)
                                .frame(width: 250, height: 50, alignment: .center)
                        }
                    }
                }
            }
            
            Section {
                Text("Comment")
                    .multilineTextAlignment(.center)
                TextField("What did you think of this anime?", text: $comment, axis: .vertical)
                    .frame(height: 400)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding([.leading, .trailing], 4)

            }
        }
        Text("Add Input")
            .font(.system(size: 18, weight: .regular, design: .rounded))
            .padding(10)
            .background(Color(.systemGray3))
            .padding(.bottom , 20)
            .onTapGesture {
                addInput()
                dismiss()
            }
    }
    
    func addInput() {
        let ratingRounded = Double(round(100 * rating1) / 100)
        var documentId: String = "nil"
        
        for item in repoViewModel.toDoList{
            if item.mal_id == anime.info.mal_id {
                documentId = item.id!
            }
        }
        
        let todo = Data(mal_id: anime.info.mal_id, title: anime.info.title, status: anime.info.status, rating: anime.info.rating, score: anime.info.score, synopsis: anime.info.synopsis, genres: anime.info.genres, images: anime.info.images.jpg.large_image_url, my_score: ratingRounded, my_comment: comment)
        
        
        repoViewModel.updateToDo(docId: documentId, todo: todo)
    }
}
