//
//  SDWebImage.swift
//  SwiftPlayground
//
//  Created by francis on 20/06/2025.
//

import SwiftUI
import SDWebImageSwiftUI
//https://picsum.photos/200



struct ImageLoader:View {
    let url: String
    var contentMode: ContentMode = .fit
    
    var body: some View{
        Rectangle()
            .opacity(0)
            .overlay {
                SDWebImagLoader(url: url, contentMode: contentMode)
            }
            .clipped()
       

    }
}
fileprivate struct SDWebImagLoader:View {
    let url: String
    var contentMode: ContentMode = .fit
    
    var body : some View {
        WebImage(url: URL(string: url)) { image in
              image.resizable() // Control layout like SwiftUI.AsyncImage, you must use this modifier or the view will use the image bitmap size
          } placeholder: {
                  Rectangle().foregroundColor(.gray)
          }
            .resizable()
            .aspectRatio(contentMode: contentMode)
    }
}



final class ImagePrefetcher {
    static let instance = ImagePrefetcher()
    
    private let prefetcher = SDWebImagePrefetcher()
    private init(){}
    
    func startPrefetching (urls:[URL]){
        prefetcher.prefetchURLs(urls)
    }
    func stopPrefetching (urls:[URL]){
        prefetcher.cancelPrefetching()
    }
}


struct SDWebImage: View {
    var body: some View {
        ZStack{
            ImageLoader(url: "https://nokiatech.github.io/heif/content/images/ski_jump_1440x960.heic")

        }
    }
}

#Preview {
    SDWebImage()
}
