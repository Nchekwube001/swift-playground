//
//  FloatingOnboarding.swift
//  SwiftPlayground
//
//  Created by francis on 24/03/2025.
//

import SwiftUI

struct FloatingOnboardingView: View {
    var body: some View {
    
        GeometryReader{
            geometry in
            VStack{
                Spacer()

                Image("Image1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: geometry.size.width)
                    .aspectRatio(0.75,contentMode: ContentMode.fit)
                    .clipped()
                Spacer()
                VStack{
                    Text("Hello")
                    Text("WHats the reason you do not have your own peace of mind")
                }
                Spacer()

            }.ignoresSafeArea()
        }
    }
}


#Preview {
    FloatingOnboardingView()
}
