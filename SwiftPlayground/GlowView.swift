//
//  Shimmer.swift
//  SwiftPlayground
//
//  Created by francis on 24/03/2025.
//

import SwiftUI

struct GlowView:View {
    @State private var moveGradient = true
    let screenWidth = UIScreen.main.bounds.size.width
    var body: some View{
        ZStack{
            Color.black.ignoresSafeArea()
            HStack{
                Circle()
                    .frame(width: 100)
                    .foregroundColor(.red )
                    .glow()
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.blue)
                    .frame(width: 100,height: 100)
                    .glow()
                
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                    .font(.system(size: 100))
                    .glow()
            }
        }
    }
}


struct Glow:ViewModifier{
    @State private var isBlur = false
    func body(content: Content) -> some View {
        ZStack{
            content.blur(radius: isBlur ? 20 : 3)
                .animation(.easeOut(duration: 0.5).repeatForever(),value: isBlur)
                .onAppear{
                    isBlur.toggle()
                }
            content
        }
    }
}

extension View {
    func glow()-> some View{
        modifier(Glow())
    }
}

#Preview {
    GlowView()
}
