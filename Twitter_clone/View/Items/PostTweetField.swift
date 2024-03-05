//
//  PostTweetField.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 27/02/2024.
//

import SwiftUI

struct PostTweetField: View {
    var placeholeder : String
    @Binding var text : String

    var body: some View {
       
        VStack{
            ZStack(alignment:.leading, content: {
                
              
                
                TextField("", text: $text)
                    .frame(height: 45)
                    .foregroundColor(Color("bg"))
                    .contentShape(Circle())
                    
                
            })
            Rectangle()
                .frame(height: 1,alignment: .center)
                .frame(minWidth: 0,maxWidth: .infinity)
                .foregroundColor(.gray)
                .padding(.top,-2)
            
        }
        
        .padding(.horizontal)
        
        
        
    }
}

