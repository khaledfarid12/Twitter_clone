//
//  CustomAuthTextField.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 14/02/2024.
//

import SwiftUI

struct CustomAuthTextField: View {
    var placeholeder : String
    @Binding var text : String

    var body: some View {
       
        VStack{
            ZStack(alignment:.leading, content: {
                
                if text.isEmpty {
                    
                    Text(placeholeder)
                        .foregroundColor(.gray)
                }
                
                TextField("", text: $text)
                    .frame(height: 45)
                    .foregroundColor(Color("bg"))
                    .contentShape(Circle())
                    
                
            })
            Rectangle()
                .frame(height: 1,alignment: .center)
                .foregroundColor(.gray)
                .padding(.top,-2)
            
        }
        .padding(.horizontal)
        
    }
}



