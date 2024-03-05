//
//  Main.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 09/02/2024.
//

import SwiftUI

struct Main: View {
    @State var selectedIndex = 0
    @State var showPostAction = false
    @Binding var x : CGFloat
    
    var show = false
    
    
    let user : User
    
    var body: some View {
        VStack{
            ZStack{
                TabView {
                    Feed(user: user)
                .onTapGesture{
                        self.selectedIndex = 0
                }
                .navigationBarHidden(true)
                    .tabItem {
                        Image(systemName:"house.fill")
                    } .tag(0)
                    
                    
                    
                    Seacrhview()
                        .onTapGesture{
                        self.selectedIndex = 1
                        }
                        .navigationBarHidden(true)
                    
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                                
                        }.tag(1)
                    
                    
                     NotificationsView()
                        .onTapGesture{
                        self.selectedIndex = 2
                        }
                        .navigationBarHidden(true)
                        .tabItem {
                        Image(systemName: "message.fill")
                            
                        }.tag(2)
                    
                    MessageView()
                        .onTapGesture{
                        self.selectedIndex = 3
                    }  .navigationBarHidden(true)
                        .tabItem {
                            Image(systemName: "envelope.fill")
                        }.tag(3)
                }.scrollDisabled(false)
                
                
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Button {
                            self.showPostAction.toggle()
                            
                        } label: {
                            Image(systemName: "k.circle")
                                .resizable()
                                .background(Color(.white))
                                .frame(width: 30,height: 30)
                                
                        }

                        
                    }.padding()
                }
                .padding(.bottom,65)
            }
            .sheet(isPresented: $showPostAction, content: {
             PostView()
            })
          
            
            
        }
    }
}

