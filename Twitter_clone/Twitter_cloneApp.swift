//
//  Twitter_cloneApp.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 08/02/2024.
//

import SwiftUI

@main
struct Twitter_cloneApp: App {
    
    
    init (){
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
