//
//  SearchCell.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 10/02/2024.
//

import SwiftUI

struct SearchCell: View {
    var tweets = ""
    var tag = ""
    var body: some View {
        
        VStack(alignment: .leading,spacing: 5, content: {
            Text("hello").fontWeight(.heavy)
            Text(tweets + " tweets").fontWeight(.light)
        })
    }
}

#Preview {
    SearchCell()
}
