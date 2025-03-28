//
//  ImagePicker.swift
//  SwiftPlayground
//
//  Created by francis on 28/03/2025.
//

import SwiftUI
import PhotosUI

struct ImagePicker:View {
    @State private var avatarImage:UIImage?
    @State private var images:[UIImage] = []
    @State private var photoPickerItems :[PhotosPickerItem] = []
    let defaultAvatar = UIImage(named: "Image1")
    var body: some View {
        VStack{
            
            PhotosPicker(
                "Select Photos",
                selection: $photoPickerItems,
                maxSelectionCount: 5,
                selectionBehavior: .ordered
            )
            
            HStack(spacing:20){
                ScrollView(.horizontal){
                    HStack{
                        ForEach(0..<images.count,id:\.self){
                            i in
                            Image(uiImage: images[i])
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100,height: 100)
                                .clipShape(.circle)
                        }
                    }
                }
               
         
            }
        }
        .padding(6)
        .onChange(of: photoPickerItems){
            _,_ in
            Task{
                for item in photoPickerItems{
                    if let data = try? await item.loadTransferable(type:Data.self) {
                        if let image = UIImage(data: data){
                            images.append(image)
                        }
                            
                    }
                    photoPickerItems.removeAll()
                }
            }
        
        }
        
        
    }
}


#Preview {
    ImagePicker()
}
