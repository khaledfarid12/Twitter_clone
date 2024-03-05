//
//  MessageView.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 09/02/2024.
//

import SwiftUI

struct MessageView: View {
    var body: some View {
        VStack{
            ScrollView{
                ForEach(0..<9){ _ in
                    MessageCell()
                }
            }
            
        }
    }
}

#Preview {
    MessageView()
}
