//
//  Extensions.swift
//  Twitter_clone
//
//  Created by khaled abd ellatif on 11/02/2024.
//

import UIKit
import SwiftUI
extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        
    }
    
}


extension View  {
    func getReact () -> CGRect{
        return UIScreen.main.bounds
        
    }
    
}
