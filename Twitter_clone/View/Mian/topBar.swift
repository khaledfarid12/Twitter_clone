//
//  topBar.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 11/02/2024.
//

import SwiftUI

struct topBar: View {
    @State var width = UIScreen.main.bounds.width
    @Binding var x : CGFloat
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {

                    withAnimation {
                        x = 0
                    }
                }, label: {
                    Image(systemName: "line.horizontal.3")
                        .foregroundColor(Color("bg"))
                        .font(.system(size: 24))
                    
                })
                
              Spacer()
                    Image(systemName: "k.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40,height: 40)
                        .foregroundColor(.bg)
                    Spacer()

                  
                }
            .padding()
         

                
            Rectangle()
                .frame(width: width,height: 1, alignment: .center)
                .foregroundColor(.gray)
                .opacity(0.3)
            }
        .background(Color(.white))
        }
    }



