//
//  FeedViewModel.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 28/02/2024.
//

import SwiftUI



class FeedViewModel : ObservableObject {
   
    @Published var tweets = [Tweet]()
    
    init() { 
        fetchTweets()
    }
    
    
    func fetchTweets () {
        RequestServices.requestDomain = "http://localhost:3000/tweets"
        
        RequestServices.FetchTweets { result in
            switch result {
                    case.success(let data):
                    guard let tweets =  try? JSONDecoder().decode([Tweet].self, from: data as! Data) else {return}
                    DispatchQueue.main.async {
                        self.tweets = tweets
                    }
                    case .failure(let error):
                    print(error.localizedDescription)
            }
        }
        
    }
    
    
}
