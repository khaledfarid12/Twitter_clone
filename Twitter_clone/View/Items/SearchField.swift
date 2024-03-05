//
//  SearchField.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 10/02/2024.
//

import SwiftUI

struct SearchField: View {
    @Binding var text : String
    @Binding var isEditing : Bool
    var body: some View {
        HStack{
            TextField("TweetSearch", text: $text)
                .padding(8)
                .padding(.horizontal,24)
                .background(Color(.systemGray6))
                .cornerRadius(25)
                .overlay(
                    Image(systemName: "magnifyingglass")
                        .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                        .padding(.leading,9)
                )
            
         
                .onTapGesture {
                    isEditing = true
                }
            
            Button(action: {
                isEditing = false
                text = ""
                UIApplication.shared.endEditing()
                
            }, label: {
                Text("Cancel")
                    .padding(.trailing,8)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                    
            })

        }
    }
}


