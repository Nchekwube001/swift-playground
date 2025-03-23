//
//  ContentView.swift
//  SwiftPlayground
//
//  Created by francis on 23/03/2025.
//

import SwiftUI

struct ContentView: View {
    @State var text = ""
    @State var isEdit = false
    var body: some View {
        VStack {
            TextField("Enter Username",text:$text,onEditingChanged: {
                isEditing in
                isEdit = isEditing
                print(isEditing)
            })
            .textFieldStyle(.roundedBorder)
                .padding()
                
            Button("Done"){
                print(text)
                UIApplication.shared.onEndEditing()
            }
        }
        .padding()
    }
}


extension UIApplication {
    func onEndEditing(){
        
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    ContentView()
}
