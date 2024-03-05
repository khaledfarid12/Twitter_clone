//
//  PostView.swift
//  Twitter_clone
//
//  Created by Ahmed Sameh on 09/02/2024.
//

import SwiftUI

struct PostView: View {
    @State var text = ""
    @State var show : Bool = false
    @State  var imagePickerPressented = false
    @State var selectedImage : UIImage?
    @State var postImage : Image?
    @State var width = UIScreen.main.bounds.width
    @ObservedObject var viewModel = CreateTweetViewModel()
    var body: some View {
        VStack{
            
            HStack{
                Button(action: {
                    
                    self.show.toggle()
               
                    
                }, label: {
                    Text("Cancel")
                })
                Spacer ()
                Button(action: {
    
                    self.viewModel.uploadPost(text: text, image: selectedImage)
                    
                     self.show.toggle()
               
                    
                }, label: {
                    Text("Tweet").padding()
                
                    
                }) .background(Color("bg"))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                
               
            }
          PostTweetField(placeholeder: "Type something to Tweet :)", text: $text)
            
            Spacer()
            
            
       
            if postImage == nil {
                
                Button(action: {
                    self.imagePickerPressented.toggle()
                }, label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70,height: 70 )
                        .clipped()
                        .padding(.top)
                        .foregroundColor(.black)
                })
                .sheet(isPresented: $imagePickerPressented,onDismiss: {
                    loadImage()
                } , content: {
                    
                    ImagePicker(image: $selectedImage)
                })
            }
            
              else if let image = postImage
            {
                VStack{
                    HStack(alignment:.top)
                    {
                        image
                            .resizable()
                            .scaledToFill()
                            .padding(.horizontal)
                            .frame(width:width * 0.9 , height: 350)
                            .cornerRadius(16)
                            .clipped()
                    }
                    
                  
                }
            }
            
            
           
                
        }.padding()
    }
}

extension PostView {
    func loadImage(){
        
        guard let selectedImage = selectedImage else {return}
        postImage = Image(uiImage: selectedImage)
    }
    
}


