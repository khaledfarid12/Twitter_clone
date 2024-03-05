//
//  Seacrhview.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 09/02/2024.
//

import SwiftUI

struct Seacrhview: View {
    @State var text : String = ""
    @State var isEditing : Bool = false
    var body: some View {
        VStack{
            HStack{
                SearchField(text: $text, isEditing:$isEditing )
               
            }.padding()
            if (!isEditing) {
                List(0..<10){
                    i in SearchCell(tweets: String(i), tag:"hello")
                }.listStyle(.inset)
            } else {
                List (0..<10){_ in
                    SearchUserCell()
                    
                }.listStyle(.inset)
            }
           
        }
    }
}

#Preview {
    Seacrhview()
}
