//
//  Popover.swift
//  SwiftPlayground
//
//  Created by francis on 24/03/2025.
//

import SwiftUI


struct StepperrView: View {
    @State var stepValue = 1
    var body: some View {
        List{
            Stepper("Select Quantity", value:$stepValue)
            Text("\(stepValue)")
        }
      
    }
}


#Preview {
    StepperrView()
}
