//
//  RequestServices.swift
//  Twitter_clone
//
//  Created by khaledabdellatif on 25/02/2024.
//

import Foundation


class RequestServices  {
    public static var requestDomain = ""

    
    public static func postTweet(text: String , user: String , username : String , userId: String ,completionHandler : @escaping(_ result : [String : Any]? ) -> Void ) {
        
        let params = ["text": text , "userId": userId, "user" : user ,"username" : username ] as [String :Any]
        
        let url = URL(string: requestDomain)!
        
        let session = URLSession.shared
        
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        
        
        do {
            request.httpBody = try? JSONSerialization.data(withJSONObject: params , options: .prettyPrinted)
            
        }
        
        catch let error
                
        {
            print(error)
        }
        
        
        let token = UserDefaults.standard.object(forKey: "jsonwebtoken")!
        
        request.addValue("Bearer\(token)", forHTTPHeaderField: "Authorization")
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        let task = session.dataTask(with: request) { data, res, err in
           
            guard  err == nil else {return}
            
            
            guard let data = data else {return}
            
            do {
                    
                    if let json = try JSONSerialization.jsonObject(with: data,options: .mutableContainers) as? [String : Any ]
                    {
                        completionHandler(json)
                    }
                    
                    
            }
            catch let error
                {
                    print(error)
                }
            
            
        }
        
        task.resume()
    
        
        
    }
    
    
    
    
    static func FetchTweets(completionHandler : @escaping( _ result:Result<Data?,NetworkError>) -> Void ) {
        
        
        let url = URL(string: requestDomain)!
        
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request) { data, res, error in
            
            guard  error == nil else {
                completionHandler(.failure(.noData))
                return
            }
            
            guard let data = data else {return}
            
            completionHandler(.success(data))
        }
        
        task.resume()
    }
    
}
