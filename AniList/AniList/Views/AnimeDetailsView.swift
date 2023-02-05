//
//  AnimeDetailsView.swift
//  AniList
//
//  Created by Claudia Burton on 2022-12-07.
//

import SwiftUI

struct AnimeDetailsView: View {
    
    @State var myAnime: MyAnime?
    @State var anime: AnimeInfo
    @State var imgUrl: String
    var height: Double = 350
    var width: Double = 300
    //@State var fromList: Bool
    @EnvironmentObject var viewModel: AnimeViewModel
    
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
                        Text(String(anime.rating))
                            .font(.system(size: 14, weight: .regular, design: .rounded))
                            .padding(.bottom, 10)
                            .padding(.top, 10)
                        
                        Spacer()
                        
                        Text(String(anime.score) + " out of 10")
                            .font(.system(size: 14, weight: .regular, design: .rounded))
                            .padding(.bottom, 10)
                            .padding(.top, 10)
                    }
                    .frame(width: 320, height: 40)
                    
                    Text("Status: \(anime.status)")
                        .padding(10)
                        .padding(.bottom, 10)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(){
                            ForEach(anime.genres) { genres in
                                Text(genres.name)
                                    .padding(10)
                                    .background(Color(.systemGray5))
                            }
                        }
                    }
                    .frame(width: 320)
                    
                    Text(anime.synopsis)
                        .font(.system(size: 17, weight: .regular, design: .rounded))
                        .frame(width: 320)
                        .padding(.bottom, 20)
                        .padding(.top, 10)
                }
            }
        .navigationTitle(anime.title)
        
        // do something so that it is changed to a delete from list button -- or make it so u can only delete from list
        // if fromlist, show remove icon instead
        
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                AddToListButton(anime: anime)
                    .environmentObject(viewModel)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
