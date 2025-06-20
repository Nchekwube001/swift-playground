//
//  Lotties.swift
//  SwiftPlayground
//
//  Created by francis on 20/06/2025.
//

import SwiftUI
import Lottie
struct Lotties: View {
    @State private var showAlert = false
    var body: some View {
        LottieView(animation: .named("ReactAnimation"))
            .playing(loopMode: .playOnce)
            .animationDidFinish { completed in
              
                showAlert = completed
            }
            .alert(isPresented:$showAlert) {
                Alert(
                          title: Text("Current Location Not Available"),
                          message: Text("Your current location can’t be " +
                                          "determined at this time.")
                          
                      )
            }
    }
}

#Preview {
    Lotties()
}
