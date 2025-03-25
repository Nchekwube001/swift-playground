//
//  TextSequence.swift
//  SwiftPlayground
//
//  Created by francis on 25/03/2025.
//

import SwiftUI

struct TextSequenceView:View {
    var body: some View {
        Text("Hello, Francis!!!")
            .font(.largeTitle)
            .phaseAnimator([0,1,3,3,2,1]){
                content, phase in
                
                content
//                    .scaleEffect(phase)
                    .scaleEffect(phase == 1 ? 1 : 0.3)
                    .opacity(phase == 1 ? 1 : 0.3)
            }animation: { phase in
                    .easeIn(duration: 2)
            }
    }
}

#Preview {
    TextSequenceView()
        .preferredColorScheme(.dark)
}
