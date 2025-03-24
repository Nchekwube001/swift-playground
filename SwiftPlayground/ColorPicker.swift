//
//  Popover.swift
//  SwiftPlayground
//
//  Created by francis on 24/03/2025.
//

import SwiftUI


struct ColorPickerView: View {
    @State var selectedColor = Color.indigo
    var body: some View {
        List{
            ColorPicker("Select Any Color", selection: $selectedColor)
            
//            Text(selectedColor.)
        }
      
    }
}


#Preview {
    ColorPickerView()
}
