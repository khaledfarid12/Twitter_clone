//
//  ProfileUserView.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 13/02/2024.
//

import SwiftUI

struct ProfileUserView: View {
    @State var offsit : CGFloat = 0
    @State var tittleoffset : CGFloat = 0
    @State  var currenttab : String = "Tweets"
    @Namespace var animation
    @State var tabbaroffset : CGFloat = 0

    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            VStack(spacing:15){
                GeometryReader {
                    proxy -> AnyView in
                    let minY = proxy.frame(in: .global).minY
                    DispatchQueue.main.async {
                        
                        self.offsit = minY
                    }
                    return AnyView(
                        ZStack{
                            Image("twetter")
                              .resizable()
                              .aspectRatio(contentMode: .fill)
                              .frame(width: getReact().width , height: minY > 0 ? 180 + minY : 180 , alignment:.center )
                              .cornerRadius(0)
               
                            
                            blurView()
                                .opacity(blurViewOpacity())
                            
                            VStack(spacing : 5){
                                Text("khaled")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Text("150 Tweets")
                                    .foregroundColor(.white)
                               
                                
                                
                            }
                           
                            .offset(y:100)
                            .offset(y:tittleoffset > 100 ?  0 : -getTitleOffset())
                            .opacity(tittleoffset < 100 ? 1 : 0)
                        }
                        .clipped()
                        .frame(height: minY > 0 ? 170 + minY : nil )
                        .offset(y: minY > 0 ? -minY : -minY < 80 ?  0 : -minY - 80 )
                    )
                }
                .frame(height: 180)
                .zIndex(1)
                
                
                VStack{
                    HStack{
                        Image("khaled").resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 75,height: 75)
                            .clipShape(Circle())
                            .padding(9)
                            .background(Color.white.clipShape(Circle()))
                            .offset(y: offsit < 0 ? getoffset() - 20 : -20)
                            .scaleEffect(getScale())
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                             Text ("Edit profile")
                                .foregroundColor(.blue)
                                .padding(.vertical,10)
                                .padding(.horizontal,20)
                                .background(Capsule().stroke(Color.blue,lineWidth: 1.5))
                        }).padding(.top,10)
                        
                    }
                    .padding(.top,-25)
                    .padding(.bottom,-10)
                    
                    
                    
                    VStack(alignment:.leading ,spacing: 15,content: {
                        Text("khaled")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        
                        Text("@khaled_abd")
                            .foregroundColor(.gray)
                        
                        Text("i don't know what iam doing or what i don't know but atleast i know who am i :) ")
                        
                        HStack(spacing: 5){
                            Text("16")
                                
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                            
                            
                            Text("followers")
                                .foregroundColor(.gray)
                            
                            Text("620")
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.leading,10)
                            
                            
                            Text("Following")
                                .foregroundColor(.gray)
                            
                        }
                        
                                   
                    })
                    .overlay (
                        GeometryReader { proxy -> Color in
                            
                            let minY = proxy.frame(in: .global).minY
                            
                            DispatchQueue.main.async {
                                
                                self.tittleoffset = minY
                            }
                            return Color.clear
                            
                        }
                        .frame(width: 0 , height: 0) , alignment: .top)
                        VStack(spacing:0){
                           
                        ScrollView(.horizontal,showsIndicators : false) {
                            HStack(spacing: 0, content: {
                                TabButton(title: "Tweets", animation: animation, currenttab: $currenttab)
                                TabButton(title: "Tweets & Likes", animation: animation, currenttab: $currenttab)
                                TabButton(title: "Media", animation: animation, currenttab: $currenttab)
                                TabButton(title: "Likes", animation: animation, currenttab: $currenttab)
                                
                            })
                    
                        }
                        Divider()
                        
                          
                    }
                    .padding(.top,30)
                    .background(Color.white)
                    .offset(y: tabbaroffset < 90 ? -tabbaroffset + 90 : 0)
                    .overlay (
                        GeometryReader { proxy -> Color in
                            
                            let minY = proxy.frame(in: .global).minY
                            
                            DispatchQueue.main.async {
                                
                                self.tabbaroffset = minY
                            }
                            return Color.clear
                            
                        }
                        .frame(width: 0 , height: 0) , alignment: .bottom
                    )
                    
                    .zIndex(1)
                        
                    
                    VStack (spacing:18 ){
                        TweetCellView(tweet: "hey , khaled",tweetImage: "khaled")
                        Divider()
                        ForEach(1...20,id: \.self) { _ in
                            TweetCellView(tweet: sampleText)
                            Divider()
                        }
                    }.padding(.top)
                        .zIndex(0)
                      
                        
                    
                    
                    
                    
                }
                .padding(.horizontal,10)
                .zIndex(-offsit>80 ? 0 :1)
              
            }
            
            .ignoresSafeArea(.all,edges: .top)
            .navigationBarBackButtonHidden(false)
        }
    }
    
    
    func blurViewOpacity() -> Double {
        let progress = -(offsit + 80) / 150
        
        return Double (-offsit > 80 ? progress : 0)
        
    }
    
    func getoffset () -> CGFloat {
        let progress = (-offsit / 80) * 20
        return progress <= 20 ? progress : 20
        
        
        
    }
    
    
    func getTitleOffset() -> CGFloat {
        let progress = 20 / offsit
        let offsit = 36 * (progress > 0 && progress < 1 ? progress : 1)
        return offsit
        
        
    }
    
    
    func getScale() -> CGFloat {
        let progress = -offsit / 80
        let scale = 1.8 - (progress < 1.0 ? progress : 0)
        return scale < 1 ? scale : 1
    }

}

#Preview {
    ProfileUserView()
}
