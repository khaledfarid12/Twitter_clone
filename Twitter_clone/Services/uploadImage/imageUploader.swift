//
//  imageUploader.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 28/02/2024.
//

import SwiftUI










class ImageUploader {
    
    static func uploadimage(paramName : String,  fileName : String ,image: UIImage, urlPath : String ) {
        let url = URL(string: "http://localhost:3000\(urlPath)")
        
        let boundary = UUID().uuidString
        let session = URLSession.shared
    
        
        var urlrequest = URLRequest(url: url!)
        
        
        urlrequest.httpMethod =  "POST"
        
        
        // authentication part
        
        
        let token = UserDefaults.standard.object(forKey: "jsonwebtoken")!
        
        urlrequest.addValue("Bearer\(token)", forHTTPHeaderField: "Authorization")
        urlrequest.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var data = Data()
        
        data.append("\r\n--\(boundary)\r\n".data(using:.utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(paramName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
        data.append(image.pngData()!)
        
        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        
        
        let task = session.uploadTask(with: urlrequest, from: data) { responseData, response, error in
                
            if error == nil {
                
                let jsonData = try? JSONSerialization.jsonObject(with: responseData! , options:.allowFragments)
                
                if let json = jsonData as? [String : Any] {
                    print(json)
                }
            }
        }
            
        task.resume()
    }
}
