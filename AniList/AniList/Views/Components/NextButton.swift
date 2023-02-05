//
//  NextButton.swift
//  AniList
//
//  Created by Claudia Burton on 2022-12-07.
//

import SwiftUI

struct NextButton: View {

    @EnvironmentObject var viewModel: AnimeViewModel
    
    var body: some View {
        Image(systemName: "chevron.right.circle.fill")
            .font(.title)
            .foregroundColor(Color(.systemGray))
            .frame(height: 50)
            .onTapGesture {
                incrementPage()
            }
    }
    
    func incrementPage() {
        viewModel.page += 1
        viewModel.fetchOtherPage()
        //print(viewModel.animePage.data[0].title)
    }
}
