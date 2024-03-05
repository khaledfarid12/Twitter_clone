//
//  AuthServices.swift
//  Twitter_clone
//
//  Created by khaled abd ellatif on 21/02/2024.
//

import Foundation
import SwiftUI

// for making Network Error while passig data

enum NetworkError:Error {
    case InvalidUrl
    case noData
    case decodingError
    
}

// for making Invalid error while authentication of data

enum AuthenticationError :Error {
    case CredentialError
    case Custom(erorMessage : String)
}



public class AuthServices {
    
    public static var reqDomian = ""
    
    
    static func login(email : String , password : String , completionHandler : @escaping(_ result : Result<Data?,AuthenticationError>)->Void){
        let urlString = URL(string:"http://localhost:3000/users/login")!
        
        makeRequest(urlString: urlString, reqBody: ["email": email , "password": password]) { res in
            switch res {
            case.success(let data):
                completionHandler(.success(data))
                
            case.failure(let error):
                completionHandler(.failure(.CredentialError))
                
            }
        }
        
    }
    
    static func register (email:String , name : String , username : String , password : String , completionHandler : @escaping(_ result : Result<Data?,AuthenticationError>) -> Void){
        
        let urlString = URL(string:"http://localhost:3000/users")!
        
        
        makeRequest(urlString: urlString, reqBody: ["email":email,"name":name , "username":username , "password":password]) { result in
            switch result {
            case .success(let data):
                completionHandler(.success(data))
            case .failure(_):
                completionHandler(.failure(.CredentialError))
            }
        }
        
    }
    
    static  func makeRequest (urlString :URL , reqBody:[String:Any],completionHandler: @escaping( _ result:Result<Data?,NetworkError> ) -> Void )
    {
     
        
        let session = URLSession.shared
        
        var request = URLRequest(url:urlString)
        
        request.httpMethod = "POST"
        
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject:reqBody,options: .prettyPrinted)
            
        } catch let error {
            completionHandler(.failure(.InvalidUrl))
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with:request) {  data,res,err in
            guard  err == nil  else{
                return
            }
            
            
            guard let data = data else{
                completionHandler(.failure(.noData))
                return
            }
            
            completionHandler(.success(data))
                do {
                    if let json = try JSONSerialization.jsonObject(with: data,options: .mutableContainers) as? [String: Any]
                    {
                        
                    }
                    
                } catch let error {
                    completionHandler(.failure(.decodingError ))
                }
            
        }
    
        task.resume()
        
    }
    
    
    
    static func FetchUser (id : String , completionHandler: @escaping(_ result:Result<Data,AuthenticationError>) -> Void) {
        
        
        let urlString = URL(string:"http://localhost:3000/users/\(id)")!
        
        var urlrequest = URLRequest(url: urlString)
        
        let session = URLSession.shared
        
        urlrequest.httpMethod = "GET"
        
        urlrequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlrequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        let task = session.dataTask(with: urlrequest) { data, res, err in
            guard let err = err else {return}
            
            
            
            guard let data = data else {
                return
                completionHandler(.failure(.CredentialError))
                
            }
            
            completionHandler(.success(data))
                 do {
                    if let json = try? JSONSerialization.jsonObject(with: data,options: .mutableContainers) as? [String: Any]{
                        
                    }
                    
                } catch let error {
                    completionHandler(.failure(.CredentialError ))
                    print(error)
                }
        }
        task.resume()
        
    }
    
}
