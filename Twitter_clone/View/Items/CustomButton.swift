//
//  SwiftUIView.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 14/02/2024.
//

import SwiftUI

struct CustomButton: View {
    @State var tittle : String
    @State var tittleImage : String
    var body: some View {
        HStack(spacing: -4){
        
            Button(action: {}, label: {
                Image(tittleImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                   
                    .frame(width: 30,height: 30)
                   
                
                
                Text(tittle).fontWeight(.bold)
                    .foregroundColor(.black)
                    .font(.title3)
                    
            })
            .overlay {
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.black,lineWidth: 1)
                    .opacity(0.3)
                    .frame(width: 320, height: 60,alignment: .center)
        }
 
            
            
            
        }.padding(.top,30)
    }
}





struct SwiftUIView_Previews : PreviewProvider{
    static var tittle : String = ""
    static var tittleImage : String = ""

    static var previews: some View{
        CustomButton(tittle:tittle, tittleImage:tittleImage )
    }
}

