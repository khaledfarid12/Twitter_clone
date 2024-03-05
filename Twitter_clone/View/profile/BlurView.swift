//
//  BlurView.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 13/02/2024.
//

import Foundation
import SwiftUI

struct blurView : UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIVisualEffectView{
        
        let view =  UIVisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterialDark))
        
        return view
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}
