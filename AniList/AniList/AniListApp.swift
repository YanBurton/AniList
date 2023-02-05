//
//  AniListApp.swift
//  AniList
//
//  Created by Claudia Burton on 2022-12-06.
//

import SwiftUI
import Firebase

@main
struct AniListApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
