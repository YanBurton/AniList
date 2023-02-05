//
//  AnimeView.swift
//  AniList
//
//  Created by Claudia Burton on 2022-12-06.
//

import SwiftUI

struct AnimeView: View {
    /*@State*/ var anime: AnimeInfo
    var height: Double = 300
    var width: Double = 230
    /*@State*/ var imgUrl: String
    @EnvironmentObject var viewModel: AnimeViewModel
    
    var body: some View {
        VStack {
            NavigationLink(destination: AnimeDetailsView(anime: anime, imgUrl: imgUrl)
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
            
            Text(anime.title.capitalized)
                .font(.system(size: 20, weight: .regular, design: .rounded))
                .padding(.top, 20)
                .padding(.bottom, 10)
                .frame(width: 320, height: 60)
            
            HStack{
                Text(anime.rating)
                    .font(.system(size: 14, weight: .regular, design: .rounded))
                    .padding(.bottom, 10)
                
                Spacer()
                
                Text(String(anime.score) + " out of 10")
                    .font(.system(size: 14, weight: .regular, design: .rounded))
                    .padding(.bottom, 10)
            }
            .frame(width: 320, height: 40)
            
            Text(anime.synopsis)
                .font(.system(size: 14, weight: .regular, design: .rounded))
                .frame(width: 320, height: 100)
                .padding(.bottom, 20)
        }
        Divider()
    }
}
