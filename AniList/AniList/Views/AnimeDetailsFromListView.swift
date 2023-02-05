//
//  AnimeFromListView.swift
//  AniList
//
//  Created by Claudia Burton on 2022-12-07.
//

import SwiftUI

struct AnimeDetailsFromListView: View {
    
    var anime: MyAnime
    var imgUrl: String
    var height: Double = 350
    var width: Double = 300
    
    @State private var showingSheet = false
    
    var body: some View {
        ScrollView (showsIndicators: false) {
            VStack {
                AsyncImage(url: URL(string: "\(imgUrl)")) { image in
                    if let image = image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: width, height: height)
                    }
                } placeholder: {
                    ProgressView()
                        .frame(width: width, height: height)
                }
                .clipShape(Rectangle())
                .padding(.top, 20)
                
                HStack{
                    if let myRating = anime.my_score {
                        Text("My Rating: "  + String(myRating))
                            .font(.system(size: 14, weight: .regular, design: .rounded))
                            .padding(.bottom, 10)
                            .padding(.top, 10)
                    } else {
                        Text("I have not rated this manga yet")
                            .font(.system(size: 14, weight: .regular, design: .rounded))
                            .padding(.bottom, 10)
                            .padding(.top, 10)
                    }
                    
                    
                    Spacer()
                    
                    Text(String(anime.info.score) + " out of 10")
                        .font(.system(size: 14, weight: .regular, design: .rounded))
                        .padding(.bottom, 10)
                        .padding(.top, 10)
                }
                .frame(width: 320, height: 40)
                
            Text("Status: \(anime.info.status)")
                    .padding(10)
                    .padding(.bottom, 10)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(){
                        ForEach(anime.info.genres) { genres in
                            Text(genres.name)
                                .padding(10)
                                .background(Color(.systemGray5))
                        }
                    }
                }
                .frame(width: 320)
                
            Text(anime.info.synopsis)
                    .font(.system(size: 17, weight: .regular, design: .rounded))
                    .frame(width: 320)
                    .padding(.bottom, 20)
                    .padding(.top, 10)
            }
            
            Divider()
            
            HStack {
                Image(systemName: "person.fill")
                    .padding(.bottom, 10)
                    .padding(.top, 20)
                Text("User")
                    .font(.system(size: 14, weight: .regular, design: .rounded))
                    .padding(.bottom, 10)
                    .padding(.top, 20)
                Spacer()
            }
            .frame(width: 320)
            .padding(.leading, 10)
            
            HStack {
                if let comment = anime.my_comment {
                    Text(comment)
                } else {
                    Text("No comments yet...")
                        .font(.system(size: 15, weight: .regular, design: .rounded))
                }
                Spacer()
            }
            .frame(width: 320)
            .padding(.leading, 10)
            .padding(.bottom , 20)

            Text("Add My Thoughts")
                .font(.system(size: 18, weight: .regular, design: .rounded))
                .padding(10)
                .background(Color(.systemGray3))
                .padding(.bottom , 20)
                .onTapGesture {
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    AddCommentSheet(anime: anime)
                }
        }
        .navigationTitle(anime.info.title)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                RemoveFromListButton(anime: anime.info)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
