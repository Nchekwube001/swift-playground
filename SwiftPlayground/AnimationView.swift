//
//  ContentView.swift
//  SwiftPlayground
//
//  Created by francis on 23/03/2025.
//

import SwiftUI

struct AnimationView: View {
    @State private var isAnimated = false
    
    var body: some View {
        VStack(spacing:50){
            Text("SwiftUI Animations")
                .font(.headline)
                .padding()
            
            
            RoundedRectangle(cornerRadius: isAnimated ? 100 : 50)
                .frame(width: 200, height: 200)
                .foregroundColor(isAnimated ? .red : .yellow)
                .scaleEffect(isAnimated ? 1.5 : 1.0)
                .rotationEffect(isAnimated ? .degrees(720) : .zero)
                .opacity(isAnimated ? 0.5 : 1.0)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        isAnimated.toggle()
                    }
                }
            Spacer()
        }.padding(50)
    }
}




#Preview {
    AnimationView()
}
