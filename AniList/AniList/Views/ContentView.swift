//
//  ContentView.swift
//  AniList
//
//  Created by Claudia Burton on 2022-12-06.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel =  AnimeViewModel()
    
    var body: some View {
        TabView {
            NavigationView {
                DiscoverView()
                    .environmentObject(viewModel)
            }
            .tabItem{Label("Discover", systemImage:"house")}
            
            NavigationView {
                //AnimeList()
                MyListView()
                    .environmentObject(viewModel)
            }
            .tabItem{Label("My List", systemImage:"list.number")}
        }
    }
}
