//
//  RegisterView.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 14/02/2024.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var ViewModel : AuthViewModel
    
    @State var name  = ""
    @State var email = ""
    @State var username = ""
    @State var password  = ""
    
    @Environment (\.presentationMode) var presentaionmode
    var body: some View {
        VStack{
            ZStack{
                
                HStack{
                    
                    Button(action: {
                        presentaionmode.wrappedValue.dismiss()
                    }, label: {
                        Text("Cancel")
                            .foregroundColor(Color("bg"))
                        
                        Spacer()
                    })
                    
                    
                }.padding(.horizontal)
                Image(systemName: "k.circle")
                    .resizable()
                    .background(Color(.white))
                    .foregroundColor(Color("bg"))
                    .frame(width: 40,height: 40)
                
            }
            Text("Create an Account")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top,30)
            
            
            VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                CustomAuthTextField(placeholeder: "Name", text: $name)
                CustomAuthTextField(placeholeder: "username", text: $username)
                CustomAuthTextField(placeholeder: "Phonenumber or Email", text: $email)
                SecureTextField(placeholeder:"password", text: $password)
                
                Spacer()
                
            
            })
       
            VStack{
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
                
                
                HStack{
                    Spacer()
                    
                    Button(action: {
                        self.ViewModel.Register(name: name, username: username, email: email, password: password)
                    }, label: {
                        Capsule()
                              .frame(width: 70,height: 40)
                              .foregroundColor(.bg)
                              .overlay {
                                  Text("Next")
                                      .foregroundColor(.white)
                                      .font(.title3)
                                      .fontWeight(.bold)
                              }
                    })
                        
                    

                    
                    
                }.padding(8)
              
            }
        }
    }

}

#Preview {
    RegisterView()
}
