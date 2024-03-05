//
//  MessageCell.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 11/02/2024.
//

import SwiftUI

struct MessageCell: View {
    @State var width = UIScreen.main.bounds.width
    var body: some View {
        VStack(alignment:.leading, spacing:nil){
            Rectangle()
                .frame(width: width,height: 1, alignment: .center)
                .foregroundColor(.blue)
                .opacity(0.3)
            HStack{
                Image("khaled").resizable()
                    .scaledToFit()
                    .frame(width: 55,height: 55)
                    .clipShape(Circle())
                VStack(alignment:.leading,content: {
                    HStack{
                        Text("khaled  ").fontWeight(.bold)
                            .foregroundColor(.primary)
                        +
                        
                        Text("@khaled_abd").foregroundColor(.gray)
                        
                        Spacer() 
                        Text("11/2/2024").foregroundColor(.gray)
                            .padding(.trailing)
                        
                    }
                    Text("you : How is it going?  ")
                        .foregroundColor(.gray)
                   
                }).padding(.bottom,20)
                
            }
        }.frame(width: width,height:85)
    }
}

#Preview {
    MessageCell()
}
