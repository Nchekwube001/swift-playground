//
//  LoadingView.swift
//  SwiftPlayground
//
//  Created by francis on 24/03/2025.
//

import SwiftUI

struct LoadingView: View {
    @State private var rotation :Double = 0
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 4)
                .opacity(0.3)
                .foregroundColor(.gray)
            Circle()
                .trim(from: 0, to:0.75)
                .stroke(style: StrokeStyle(lineWidth: 4,lineCap: .round,lineJoin: .round))
                .foregroundColor(.black)
                .rotationEffect(.degrees(rotation))
                .animation(.linear(duration: 1.0).repeatForever(autoreverses: false), value: rotation)
                .onAppear{
                    rotation = 360
                }
            Text("LOADING!")
        }.compositingGroup()
            .frame(width: 200)
    }
}

#Preview {
    LoadingView()
}
