//
//  AnimeListView.swift
//  AniList
//
//  Created by Claudia Burton on 2022-12-08.
//

import SwiftUI

struct AnimeListView: View {
    var anime: MyAnime
    var height: Double = 300
    var width: Double = 230
    var imgUrl: String
    @EnvironmentObject var viewModel: AnimeViewModel
    
    var body: some View {
        VStack {
            NavigationLink(destination: AnimeDetailsFromListView(anime: anime, imgUrl: imgUrl)
                .environmentObject(viewModel)) {
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
            }
            
            Text(anime.info.title.capitalized)
                .font(.system(size: 20, weight: .regular, design: .rounded))
                .padding(.top, 20)
                .padding(.bottom, 10)
                .frame(width: 320, height: 60)
            
            HStack{
                if let myRating = anime.my_score {
                    Text("My Rating: "  + String(myRating))
                        .font(.system(size: 14, weight: .regular, design: .rounded))
                        .padding(.bottom, 10)
                } else {
                    Text("I have not rated this manga yet")
                        .font(.system(size: 14, weight: .regular, design: .rounded))
                        .padding(.bottom, 10)
                }
                
                Spacer()
                
                Text(String(anime.info.score) + " out of 10")
                    .font(.system(size: 14, weight: .regular, design: .rounded))
                    .padding(.bottom, 10)
            }
            .frame(width: 320, height: 40)
            
            Text(anime.info.synopsis)
                .font(.system(size: 14, weight: .regular, design: .rounded))
                .frame(width: 320, height: 100)
                .padding(.bottom, 20)
        }
        Divider()
    }
}
