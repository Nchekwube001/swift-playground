//
//  ImageGallery.swift
//  SwiftPlayground
//
//  Created by francis on 24/03/2025.
//

import SwiftUI


struct ImageGalleryView : View {
    @Namespace private var previewSmoothly
    @State private var preview = false
    @State private var selectedImage:String?
    var body: some View {
        if preview {
            if  let selectedImage = selectedImage{
                image(selectedImage)
                    .ignoresSafeArea()
            }
        }
        else {
            Grid{
                GridRow{
                    image("Image1")
                    image("Image2")
         
                }
                GridRow{
                    image("Image3")
                    image("Image4")
                
                }
            }
            .padding(10)
        }
//        .background(.black)
    }
    
    
    func image (_ imageName : String)-> some View {
        Image(imageName)
            .resizable()
            .zIndex(selectedImage == imageName ? 2:1)
            .matchedGeometryEffect(id: imageName, in: previewSmoothly)
            .onTapGesture {
                withAnimation(Animation.easeInOut(duration: 0.3)){
                    selectedImage = imageName
                    preview.toggle()
            
                }
            }
    }
}


#Preview {
    ImageGalleryView()
}
