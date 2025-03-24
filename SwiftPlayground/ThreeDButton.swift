//
//  ThreeDButton.swift
//  SwiftPlayground
//
//  Created by francis on 24/03/2025.
//

import SwiftUI

struct ThreeD: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let offset:CGFloat = 5
        ZStack{
            RoundedRectangle(cornerRadius: 6)
                .foregroundColor(Color(red:62/255,green: 87/255,blue:178/255))
                .offset(y:offset)
            RoundedRectangle(cornerRadius: 6)
            
                .foregroundColor(Color(red:123/255,green: 152/255,blue:255/255))

                .offset(y: configuration.isPressed ? offset: 0)
            
            configuration.label.foregroundColor(.white)
                .offset(y: configuration.isPressed ? offset: 0)

            
        }
        .compositingGroup()
        .shadow(radius: 6,y:4)
    }
}


#Preview {
    Button("Button"){
        
    }
    .frame(width: 100, height: 100)
    .buttonStyle(ThreeD())
}
