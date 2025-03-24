//
//  LikeButton.swift
//  SwiftPlayground
//
//  Created by francis on 24/03/2025.
//

import SwiftUI

struct LikeButton:View{
    @State private var isLiked = false
    var body :some View {
        Button{
            isLiked.toggle()
        }label: {
            ZStack{
                image(Image(systemName: "heart.fill"), show: isLiked)
                image(Image(systemName: "heart"),show: !isLiked)
            }
         
        }
    }
    
    
    func image(_ image:Image, show:Bool)-> some View {
        image
            .tint(isLiked ? .red : .black)
            .font(.system(size: 50))
            .scaleEffect(show ? 1 : 0)
            .animation(.interpolatingSpring(stiffness: 170, damping: 15), value: show)
    }
}


#Preview {
    LikeButton()
}
