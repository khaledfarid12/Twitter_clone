//
//  TabButton.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 13/02/2024.
//

import SwiftUI

struct TabButton: View {
    var title : String
    var animation : Namespace.ID
    @Binding var currenttab : String
    var body: some View {
        
        
        Button(action: {}, label: {
            
            
            LazyVStack (spacing: 12  ) {
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundColor( currenttab == title ? .blue : .gray )
                    .padding(.horizontal)
                
                if currenttab == title {
                    Capsule()
                        .fill()
                        .frame(height: 1.2)
                        .matchedGeometryEffect(id: "TAB", in: animation)
                }
                else {
                    Capsule()
                        .fill(Color.clear)
                        .frame(height: 1.2)
                    
                }
                
                
                
                
            }
        })
        
        
        
    }
}

