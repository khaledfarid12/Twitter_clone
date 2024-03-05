//
//  User.swift
//  Twitter_clone
//
//  Created by  khaled abd ellatif on 20/02/2024.
//

import Foundation


struct ApiResponse : Decodable {
    let user : User
    let token : String
    
}


struct User : Decodable , Identifiable {
    
    var _id : String
    var id :String{
        return _id
    }
    
    let username : String
    let name : String
    let email : String
    var location : String?
    var bio : String?
    var website : String?
    var avatarExists : String?
    var followers :[String]
    var followings :[String]
    
    
}





