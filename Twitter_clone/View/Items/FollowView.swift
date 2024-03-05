//
//  FollowView.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 11/02/2024.
//

import SwiftUI

struct FollowView: View {
    var count : Int
    var tittle : String
    var body: some View {
        HStack{
            Text("\(count)")
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text("\(tittle)")
                .foregroundColor(.gray)
        }
    }
}

