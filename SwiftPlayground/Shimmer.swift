//
//  Shimmer.swift
//  SwiftPlayground
//
//  Created by francis on 24/03/2025.
//

import SwiftUI

struct ShimmerView:View {
    @State private var moveGradient = true
    let screenWidth = UIScreen.main.bounds.size.width
    var body: some View{
        Rectangle()
            .overlay{
                LinearGradient(colors: [.red,.green,.blue], startPoint: .leading, endPoint: .trailing)
                    .offset(x:moveGradient ? -screenWidth/2 : screenWidth/2,y:30)
                    .frame(width:70)
            }
            .animation(.linear(duration: 2.0).repeatForever(autoreverses: false),value: moveGradient)
            .mask{
                Text("Slide To Power Off")
                    .foregroundColor(.black)
                    .font(.largeTitle)
            }
            .onAppear{
                self.moveGradient.toggle()
            }
            .background(.gray)
    }
}
#Preview {
    ShimmerView()
}
