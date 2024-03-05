//
//  tweet.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 25/02/2024.
//


import SwiftUI


struct Tweet : Identifiable , Decodable {
    
    let _id : String
    
    var id : String {
        return _id
    }
    
    let text: String
    let userId: String
    let username: String
    let user: String
    
}
