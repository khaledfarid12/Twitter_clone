//
//  WelcomeView.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 14/02/2024.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var ViewModel : AuthViewModel
    var body: some View {
       
        NavigationView{
            VStack{
                HStack{
                    Spacer(minLength: 0)
                    Image(systemName: "k.circle")
                        .resizable()
                        .background(Color(.white))
                        .foregroundColor(Color("bg"))
                        .frame(width: 60,height: 60)
                   Spacer(minLength: 0)
                }
                Spacer()
                  Text("See what is happening in the world right now")
                    .font(.system(size: 30, weight: .heavy,design: .default))
                    .frame(width: getReact().width * 0.9, alignment: .center)
                  Spacer()
                CustomButton(tittle: "Connect to Google", tittleImage: "Google ")
              
                CustomButton(tittle: "Connet to apple ", tittleImage: "Apple")
                HStack{
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(width: (getReact().width * 0.35),height: 1)
                    Text("Or")
                        .foregroundColor(.gray)
                    
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(width: (getReact().width * 0.35),height: 1)
                    
                    
                
                    
                }
                NavigationLink(destination: RegisterView().navigationBarHidden(true)) {
                    Capsule()
                       .frame(width: 320,height: 60)
                       .foregroundColor(.bg)
                       .overlay {
                           Text("Create an Account")
                               .foregroundColor(.white)
                               .fontWeight(.bold)
                               .font(.title3)
                       }
                }
                VStack(alignment: .leading, content: {
                    VStack{
                        Text("by signing up , you agree to our ")
                        + Text("terms").foregroundColor(Color("bg"))
                        + Text(" , ") + Text("privacy policy").foregroundColor(Color("bg"))
                        + Text(" , ") + Text("Use cookies")
            
                    }
                    .padding(.bottom)
                    
                    HStack(spacing: 5){
                        Text("Have an account already?")
                       
                            
                        NavigationLink(destination:LoginView().navigationBarHidden(true)) {
                            Text("Login")
                            .foregroundColor(Color("bg"))
                            
                        }

                        
                        
                    }
                  
                })
                
                   
            }.padding()
        }
        
      
    }
}

#Preview {
    WelcomeView()
}
