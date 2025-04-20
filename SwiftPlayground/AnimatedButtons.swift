//
//  AnimatedButtons.swift
//  SwiftPlayground
//
//  Created by francis on 09/04/2025.
//

import SwiftUI

struct AnimatedButtons: View {
    @State private var isPressed = false
    @State private var isNotified = false
    var body: some View {
        VStack{
            
            
            
            
            
            Button(action:{
                withAnimation(
                    .easeInOut(duration: 0.2)
                    
                ){
                    isPressed.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15){
                        isPressed.toggle()
                    }
                }
                
            }){
                Text("Tap Here")
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    .scaleEffect( isPressed ? 0.8 : 1.0)
            }
            
            HStack (spacing: 20){
                Button("Notify Me"){
                    isNotified.toggle()
                }
                .buttonStyle(.borderedProminent)
                .tint(.pink)
                .fontWeight(.semibold)
                .controlSize(.large)
                //                .phaseAnimator([true,false]){ content, phase in
                //                    content.scaleEffect(phase ? 1.2 : 1)
                //
                //
                //                } animation: { phase in
                //                        .spring(duration: 1)
                //                }
                
                
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 40,height: 40)
                    .foregroundColor(.pink)
                    .phaseAnimator([
                        NotifyAnimationPhase.initial,
                        NotifyAnimationPhase.lift,
                        NotifyAnimationPhase.shakeLeft,
                        NotifyAnimationPhase.shakeRight,
                        NotifyAnimationPhase.shakeLeft,
                        NotifyAnimationPhase.shakeRight,
                    ], trigger: isNotified){ content, phase in
                        
                        content
                            .scaleEffect(phase.scale)
                        
                            .rotationEffect(.degrees(phase.rotation), anchor: .top)
                        
                            .offset(y:phase.yOffest)
                        
                    }animation: { phase in
                        switch phase{
                        case  .initial, .lift :  .spring(bounce:0.5)
                        case .shakeLeft, .shakeRight: .easeInOut(duration: 0.15)
                        }
                        
                    }
                
            }
        }
    }
}


#Preview {
    AnimatedButtons()
}


enum NotifyAnimationPhase : CaseIterable {
    case initial, lift, shakeLeft,shakeRight
    
    var yOffest:CGFloat {
        switch self {
        case .initial: 0
        case .lift, .shakeLeft, .shakeRight: -30
        }
    }
    var scale:CGFloat {
        switch self {
        case .initial: 1
        case .lift, .shakeLeft, .shakeRight: 1.2
        }
    }
    var rotation:Double {
        switch self {
        case .initial: 0
        case .lift : 0
        case .shakeLeft: -30
        case .shakeRight: 30
        }
    }
}
