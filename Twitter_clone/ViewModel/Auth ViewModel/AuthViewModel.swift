//
//  AuthViewModel.swift
//  Twitter_clone
//
//  Created by khaled abd ellatif on 20/02/2024.
//

import SwiftUI
import Foundation

class AuthViewModel : ObservableObject {
    @Published var isAuthenticated : Bool = false
    @Published var currentUser : User?
    
    
    init(){
        let defaults = UserDefaults.standard
        let token = defaults.object(forKey: "jsonwebtoken")
            print(token)
        
        logout()
        
                if token != nil {
                    isAuthenticated = true
                    
                    if let userId = defaults.object(forKey: "userid"){
                        fetchuser(userId: userId as! String)
                        print("User fetched ")
                    }
                }
                else {
                    isAuthenticated = false
                }
              
        }
    
    
    
    static let shared = AuthViewModel()
    
    
    
    func login(email : String , password : String ){
        
        let defaults = UserDefaults.standard
        
        AuthServices.login(email: email, password: password) { result in
            switch result {
                case .success(let data):
                       guard let user = try? JSONDecoder().decode(ApiResponse.self, from: data as! Data)else {return}
                        DispatchQueue.main.async{
                        defaults.set(user.token, forKey: "jsonwebtoken")
                        defaults.set(user.user.id, forKey: "userid")
                        self.isAuthenticated = true
                        self.currentUser = user.user
                        print("log IN")
                        
                    }
               
           case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
  // for registering
    //  1 - creating a view model
    // 2- creating service for that model
    // 3- creating model for you data that you want reach from api
    
    func Register(name : String , username : String , email: String , password : String)
    {
        AuthServices.register(email: email, name: name, username: username, password: password) { result in
            switch result {
            case .success(let data):
                    guard let user = try? JSONDecoder().decode(ApiResponse.self, from: data as! Data)
                    else {
                        return
                    }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    func fetchuser(userId:String ){
        let defaults = UserDefaults.standard
        AuthServices.reqDomian = "http://localhost:3000/users/\(userId)"
        
        AuthServices.FetchUser(id: userId) { result in
            switch result {
            case .success(let data ):
                    guard let user = try? JSONDecoder().decode(User.self, from: data as! Data)else {return}
                    
                    DispatchQueue.main.async{
                        defaults.setValue(user.id, forKey: "userid")
                        self.isAuthenticated = true
                        self.currentUser = user
                        print (user)
                        
                    }
                
        case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
    }
    
    
    func logout(){
        
        let defaults = UserDefaults.standard
        let dectionary = defaults.dictionaryRepresentation()
        
        dectionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
            
        }
        
        DispatchQueue.main.async {
            self.isAuthenticated = false
        }
        
    }
}
