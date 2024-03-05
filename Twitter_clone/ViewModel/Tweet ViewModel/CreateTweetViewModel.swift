//
//  TweetViewModel.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 25/02/2024.
//

import Foundation
import SwiftUI


class CreateTweetViewModel : ObservableObject {
    
    func uploadPost(text: String , image:UIImage?) {
        guard let user = AuthViewModel.shared.currentUser else {return}
        RequestServices.requestDomain = "http://localhost:3000/tweets"
        
        RequestServices.postTweet(text: text, user: user.name, username: user.username, userId: user.id) { result in
                
            if let image = image {
                if let id = result?["_id"]! {
                    ImageUploader.uploadimage(paramName: "upload", fileName: "image1", image: image, urlPath:"/uploadTweetImage/\(id)")
                }
            }
            
        }
  
         
    }
}
