//
//  MultiTextField.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 09/02/2024.
//

import SwiftUI

struct MultiTextField : UIViewRepresentable {
    
    @Binding var text : String
    func makeCoordinator() -> MultiTextField.Coordinator {
        return MultiTextField.Coordinator(parent1: self)
    }
    
    
    func makeUIView(context: Context) -> some UITextView {
        let text = UITextView()
        text.text = ("Type something")
        text.isEditable = true
        text.isUserInteractionEnabled =  true
        text.textColor = .gray
        text.font = .systemFont(ofSize: 20)
      
        return text
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    class Coordinator : NSObject , UITextViewDelegate {
        
        var parent : MultiTextField
        
        init(parent1: MultiTextField) {
            parent = parent1
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            textView.text = ""
            textView.textColor = .black
            
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.parent.text =  textView.text
            textView.text = ""
        }
        
    }
    
    
}
