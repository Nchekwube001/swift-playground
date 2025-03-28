//
//  SuperScrollView.swift
//  SwiftPlayground
//
//  Created by francis on 28/03/2025.
//

import SwiftUI

struct SuperScrollView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                ForEach(MockData.items){ item in
                    Circle(
                        
                    )
                    .containerRelativeFrame(
                        .horizontal,
                        count: verticalSizeClass == .regular ? 3: 4,
                        spacing: 16
                    )
                    //                    .frame(width: 100,height: 100)
                    .foregroundColor(item.color)
                    .scrollTransition{
                        content,phase in
                        content
                            .opacity(phase.isIdentity ? 1.0:0.5)
                            .scaleEffect(x: phase.isIdentity ? 1.0:0.3,
                                         y:phase.isIdentity ? 1.0:0.3
                            )
                            .offset(   y:phase.isIdentity ? 0:50)
                    }
                    
                }
            }
            .scrollTargetLayout()
        }
        .contentMargins(16, for:.scrollContent )
//        .scrollTargetBehavior(.viewAligned)
        
    }
}


struct Item:Identifiable{
    let  id = UUID()
    let color:Color
    
    
}


struct MockData{
    static var items = [
        Item(color: .teal),
        Item(color: .red),
        Item(color: .blue),
        Item(color: .black),
        Item(color: .green),
        Item(color: .indigo),
        Item(color: .gray),
        Item(color: .mint),
    ]
}


#Preview {
    SuperScrollView()
}
