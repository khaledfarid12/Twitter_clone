//
//  MenuButton.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 11/02/2024.
//

import SwiftUI

struct MenuButton: View {
    @State var title : String
    var body: some View {
        
        HStack(spacing:15){
            
            Image(systemName: title)
                .resizable()
                .renderingMode(.template)
                .frame(width: 25,height: 25)
                .foregroundColor(.black)
            
            Text(title)
                .foregroundColor(.black)
            Spacer()
            
            
        }.padding(.vertical,12)
    }
}


