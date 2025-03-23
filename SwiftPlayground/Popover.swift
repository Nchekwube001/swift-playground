//
//  Popover.swift
//  SwiftPlayground
//
//  Created by francis on 24/03/2025.
//

import SwiftUI


struct PopoverView: View {
    @State var isPopupPresented = false
    var body: some View {
        Button("Show Popup"){
            isPopupPresented.toggle()
        }.sheet(isPresented: $isPopupPresented, content:{
            PopupView()
        })
       
    }
}
struct PopupView: View {
    var body: some View {
        VStack{
            Text("This is a Popup!")
                .font(.headline)
                .padding()
            Spacer()
        }.frame(width: 200,height: 150)
            .cornerRadius(10)
            .padding()
    }
}

#Preview {
    PopoverView()
}
