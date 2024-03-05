//
//  ContentView.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 08/02/2024.
//

import SwiftUI
 
struct ContentView: View {
  
    @EnvironmentObject var ViewModel : AuthViewModel
    
    var body: some View {
     
        if ViewModel.isAuthenticated {
                if let user = ViewModel.currentUser {
                    MainVView(user: user)
                }
     } else
        {
            WelcomeView()
        }
               
    }
}

#Preview {
    ContentView()
}
