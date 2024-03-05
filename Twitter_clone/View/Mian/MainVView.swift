//
//  MainVView.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 11/02/2024.
//

import SwiftUI
 


struct MainVView: View {
    
    let user : User
   
    @State var width = UIScreen.main.bounds.width - 90
    
    
    @State var x = -UIScreen.main.bounds.width + 90
    var body: some View {
        NavigationView {
            VStack{
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .center),
                       content: {
                    VStack{
                         topBar(x: $x)
                        Main(x: $x, user: user)
                       }
                    
                    
                    SlideMenubar()
                        .shadow(color: Color.black.opacity( x != 0 ? 0.1 : 0), radius: 5,x: 5,y: 0)
                        .offset(x:x)
                        .background(.black.opacity(x == 0 ? 0.5 : 0))
                        .ignoresSafeArea(.all  ,edges: .vertical)
                        .onTapGesture {
                            withAnimation {
                                x = -width
                            }
                        }
                })
                .gesture(DragGesture().onChanged({ value in
                
                    withAnimation {
                        if value.translation.width > 0 {
                            if x < 0 {
                                x = -width + value.translation.width * 0.20
                            }
                        }
                        else {
                            if x != -width {
                                x = value.translation.width * 0.20
                            }
                            
                        }
                    }
                }).onEnded({ value in
                    withAnimation {
                        if  x < -width / 2 {
                            x = 0
                        }
                        else {
                            x = -width
                        }
                    }
                }))
                    
                
  
              
            }
            .navigationBarHidden(true)
            .navigationBarTitle("")
           
            
            
           
        }
    }
}


