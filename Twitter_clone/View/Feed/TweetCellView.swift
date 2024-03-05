//
//  TweetCellView.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 10/02/2024.
//

import SwiftUI

struct TweetCellView: View {
    @State  var clickedButton = false
    var tweet : String
    var tweetImage : String?
    var body: some View {
        VStack{
            HStack(alignment:.top  , spacing: 10   ,content: {
            
                Image("khaled").resizable()
                    .scaledToFit()
                    .frame(width: 55,height: 55)
                    .clipShape(Circle())
                VStack(alignment:.leading,spacing: 10,content: {
                    (
                        Text("khaled")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        +
                        Text("  @khaled_abd")
                            .foregroundColor(.gray)
                    
                    )
                    Text(tweet)
                        .frame(maxHeight: 100,alignment: .top)
                    
                    if let image = tweetImage {
                        GeometryReader(content: { proxy in
                            Image(image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: proxy.frame(in:.global).width ,height: 250)
                                .cornerRadius(15)
                        })
                        .frame(height: 250)
                    }
                  
                    
                })
                
            })
            HStack(alignment:.center, spacing:45){
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "ellipsis.message.fill")
                        .foregroundColor(.gray)
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "arrow.up.and.down.and.sparkles")
                        .foregroundColor(.gray)
                })
                Button(action: {
                    clickedButton.toggle()
                }, label: { 
                    if clickedButton
                    {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.gray)
                    }else {
                        Image(systemName: "heart")
                            .foregroundColor(.gray)
                    }
                 
                })
          
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.gray)
                })
                
            } .padding(.top,4)
            
        }
       
    }
}

struct TweetCellView_Previews : PreviewProvider{
    static var previews: some View{
        TweetCellView( tweet: sampleText)
    }
}

var sampleText = "hello my name is khaled and I'am an fresh graduaate mobile developer and i have experinece in faculty of science alexandria universty compouter science department"
