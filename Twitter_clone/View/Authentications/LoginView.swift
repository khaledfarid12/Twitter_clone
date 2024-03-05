//
//  LoginView.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 14/02/2024.
//

import SwiftUI

struct LoginView: View {
   
    @State var email = ""
    @State var password = ""
    @State var emailDone  = false
    @Environment (\.presentationMode) var presentaionmode
    
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        if !emailDone   {
            VStack{
                VStack{
                    ZStack{
                        Button(action: {
                            presentaionmode.wrappedValue.dismiss()
                        }, label: {
                            Text("Cancel")
                                .foregroundColor(Color("bg"))
                            
                            Spacer()
                        })
                        Image(systemName: "k.circle")
                         .resizable()
                         .background(Color(.white))
                         .foregroundColor(Color("bg"))
                         .frame(width: 40,height: 40)
                        
                        
                        
                    }.padding(.horizontal)
                    
                    
                      Text("To get started first enter your phone,name,email,or @Username")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    
                    CustomAuthTextField(placeholeder:"Phone, email , @or Username", text: $email)
                   
                        
                    }
                Spacer()
                VStack{
                    
                    Button(action: {
                        if !email.isEmpty{
                           
                            self.emailDone.toggle()
                        }
                       
                    }, label: {
                         Capsule()
                            .frame(width: 320,height: 50)
                            .foregroundColor(.bg)
                            .overlay {
                                Text("Next")
                                    .foregroundColor(.white)
                            }
                        
                    })
                    Button(action: {}, label: {
                        Text("Forget Password?")
                    })
                }
            
                }
            
        }
        else {
            VStack{
                VStack{
                    ZStack{
                        Button(action: {
                           
                        presentaionmode.wrappedValue.dismiss()
                        }, label: {
                            Text("Cancel")
                                .foregroundColor(Color("bg"))
                            
                            Spacer()
                        })
                        Image(systemName: "k.circle")
                         .resizable()
                         .background(Color(.white))
                         .foregroundColor(Color("bg"))
                         .frame(width: 40,height: 40)
                        
                        
                        
                    }.padding(.horizontal)
                    
                    
                      Text("Enter your password")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    
                   
                    SecureTextField(placeholeder: "Password", text: $password)
                        
                    }
                Spacer()
                VStack{
                    
                    Button(action: {
                        self.viewModel.login(email: email, password: password)
                    }, label: {
                         Capsule()
                            .frame(width: 320,height: 50)
                            .foregroundColor(.bg)
                            .overlay {
                                Text("Login")
                                    .foregroundColor(.white)
                            }
                        
                    })
                    Button(action: {}, label: {
                        Text("Forget Password?")
                    })
                }
            
                }
        }
            
        }
    }


#Preview {
    LoginView()
}
