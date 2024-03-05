//
//  Feed.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 09/02/2024.
//

import SwiftUI

struct Feed: View {
    let user : User
    @ObservedObject var viewModel = FeedViewModel()
    var body: some View {
        ScrollView(.vertical,showsIndicators:false) {
            
            VStack (spacing:18 ){
                TweetCellView(tweet: "hey , khaled",tweetImage: "khaled")
                Divider()
                ForEach(viewModel.tweets) { tweet in
                    TweetCellView(tweet: tweet.text)
                    Divider()
                }
            }.padding(.top)
                .padding(.horizontal)
                .zIndex(4)
        }
    }
}


