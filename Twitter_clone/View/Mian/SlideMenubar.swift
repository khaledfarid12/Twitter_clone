//
//  SlideMenubar.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 11/02/2024.
//

import SwiftUI

struct SlideMenubar: View {
    @State var show : Bool = false
    
    var menuButtons = ["person","list.clipboard","text.bubble","bookmark","bolt"]
    @EnvironmentObject var viewModel : AuthViewModel
    
    var egdes = UIApplication.shared.windows.first?.safeAreaInsets
    @State var width = UIScreen.main.bounds.width
    var body: some View {
        VStack{
            HStack(spacing:0,content: {
                
                VStack(alignment:.leading, content: {
                    
                 NavigationLink(
                    destination: ProfileUserView()
                        .navigationBarHidden(true)
                        )
                    {
                        Image("khaled").resizable()
                            .scaledToFit()
                            .frame(width: 60,height: 60)
                            .clipShape(Circle())
                    }
                    
                    
                    HStack(alignment:.top,spacing:0,content: {
                        VStack(alignment:.leading,spacing:12,content: {
                            Text("khaled")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            
                            Text("@khaled_abd")
                                .foregroundColor(.gray)
                            HStack(spacing: 20, content: {
                                FollowView(count: 8, tittle: "Folllowers")
                                
                                FollowView(count: 16, tittle: "Following")
                            })
                          
                            .padding(.top,10)
                            Divider()
                                .padding(.top,10)
                        })
                        
                        Button(action: {
                            withAnimation {
                                self.show.toggle()
                            }
                        }, label: {
                            Image(systemName: show ? "chevron.down" : "chevron.up")
                                .foregroundColor(Color("bg"))
                            
                        })
                    })
                    
                    VStack(alignment:.leading){
                        ForEach(menuButtons,id: \.self) {
                          item in MenuButton(title: item)
                        }
                        
                        Divider().padding(.top,10)
                        Button(action: {}, label: {
                        MenuButton(title: "square.and.arrow.up.circle")
                        })
                        Divider().padding(.top,10)
                        
                        Button(action: {}, label: {
                        Text("Settings and Privacy")
                                .foregroundColor(Color("bg"))
                        })
                        .padding(.top,20)
                        .padding(.bottom,10)
                        Button(action: {}, label: {
                        Text("Help Center")
                                .foregroundColor(Color("bg"))
                        })
                        Spacer()
                        
                        Divider().padding(.bottom)
                        
                        HStack{
                            Button(action: {}, label: {
                               Image(systemName:"questionmark.circle")
                                    .resizable()
                                    .foregroundColor(Color("bg"))
                                    
                                    .frame(width: 26,height: 26)
                            })
                            
                            Spacer()
                            
                            Image(systemName: "qrcode")
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 26,height: 26)
                                .foregroundColor(Color("bg"))
                            
                        }
                        
                        
                      
                        
                        
                    }
                    .opacity(show ? 1 : 0)
                    .frame(height: show ? nil : 0)
                    
                    
                    VStack(alignment:.leading,content: {
                        
                        Button(action: {}, label: {
                        Text("create a new account")
                                .foregroundColor(Color("bg"))
                        }).padding(.bottom,10)
                        
                        Button(action: {}, label: {
                        Text("Adding existing account")
                                .foregroundColor(Color("bg"))
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            viewModel.logout()
                        }, label: {
                            Capsule().frame(width: 80,height: 43).foregroundColor(.bg)
                                .overlay {
                                    Text("Log out")
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        
                                }
                        })
                        
                    })
                    .opacity(!show ? 1 : 0 )
                    .frame(height:!show ? nil : 4)
                    
                })
                .padding(.horizontal,20)
                .padding(.top,egdes!.top == 0 ? 15 : egdes?.top)
                .padding(.bottom,egdes!.bottom == 0 ? 15 : egdes?.bottom)
                .frame(width: width - 100)
                .background(.white)
                .ignoresSafeArea(.all,edges:.vertical)
                Spacer(minLength: 0)
                
            })
          
            
        }
    }
}

#Preview {
    SlideMenubar()
}
