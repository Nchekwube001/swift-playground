//
//  PulseCallView.swift
//  SwiftPlayground
//
//  Created by francis on 03/04/2025.
//

import SwiftUI

struct PulseCallView : View {
    var body: some View {
        ZStack{
            Circle()
                .fill(.blue.gradient)
                .frame(width: 172,height: 172)
                .opacity(0.2)
            
                .phaseAnimator([false,true]){ theCircle,
                     pulsating in
                    
                    theCircle
                        .scaleEffect(pulsating ? 0.8: 1.2)
                    
                } animation: { pulsating in
                        .easeOut(duration: 1)
                }
            
            Circle()
                .fill(.blue.gradient)
                .frame(width: 172,height: 172)
                .opacity(0.5)
                .phaseAnimator([false,true]){ theCircle,
                     pulsating in
                    
                    theCircle
                        .scaleEffect(pulsating ? 0.7: 1.1)
                    
                } animation: { pulsating in
                        .easeIn(duration: 1)
                }
            
            
            Circle()
                .fill(.blue.gradient)
                .frame(width: 172,height: 172)
                .opacity(0.3)
                .phaseAnimator([false,true]){ theCircle,
                     pulsating in
                    
                    theCircle
                        .scaleEffect(pulsating ? 0.5: 1.2)
                    
                } animation: { pulsating in
                        .easeInOut(duration: 1)
                }
            
            
            
            HStack(alignment: .bottom){
                Text("Calling")
                    .bold()
                    .padding(.top)
                    .font(Font.custom("SharpGrotesk-Medium20"  , size: 16))
                
                
                Image(systemName: "ellipsis")
                    .font(.title)
                    .bold()
                    .symbolEffect(.variableColor.iterative.dimInactiveLayers.reversing)
            }
         
            
        }.blendMode(.hardLight)
    }
}

#Preview {
    PulseCallView()
}
