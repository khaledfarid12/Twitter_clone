//
//  NotificationCell.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 11/02/2024.
//

import SwiftUI

struct NotificationCell: View {
    @State var width = UIScreen.main.bounds.width
    var body: some View {
        VStack{
            Rectangle()
                .frame(width: width,height: 1, alignment: .center)
                .foregroundColor(.blue)
                .opacity(0.3)
            
            HStack(alignment:.top){
                Image(systemName:"person.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20,height: 20)
                    .foregroundColor(.blue)
             
                
                VStack(alignment:.leading, spacing: 5,content: {
                    
                    Image("khaled").resizable()
                        .scaledToFit()
                        .frame(width: 36,height: 36)
                        .clipShape(Circle())
                    
                    Text("khaled  ").fontWeight(.bold)
                        .foregroundColor(.primary)
                    +
                    
                    Text("Start Following you").foregroundColor(.gray)
                })
                    
                Spacer()
            }.padding(.leading,30)
        }
       
    }
}

#Preview {
    NotificationCell()
}
