//
//  SearchUserCell.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 10/02/2024.
//

import SwiftUI

struct SearchUserCell: View {
    var body: some View {
        HStack{
            Image("khaled").resizable()
                .scaledToFit()
                .frame(width: 55,height: 55)
                .clipShape(Circle())
            VStack(alignment:.leading){
                
                Text("khaled").fontWeight(.heavy)
                Text("@khaled_abd")
                    .foregroundColor(.gray)
                
            }
            Spacer()
            
        }
    }
}

#Preview {
    SearchUserCell()
}
