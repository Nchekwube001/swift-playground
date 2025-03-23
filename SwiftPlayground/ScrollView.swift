//
//  ScrollView.swift
//  SwiftPlayground
//
//  Created by francis on 23/03/2025.
//

import SwiftUI

struct Fruit: Identifiable{
    let id = UUID()
    
}

struct ScrollViewExample:View{
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack {
                ForEach(0..<20){index in
                    ZStack{
                        LinearGradient(colors: [.red,.yellow], startPoint: .leading, endPoint: .trailing).cornerRadius(20)
                        Text("\(index+1)").font(.largeTitle)
                    }.frame(width:.infinity,height: 100).padding()
                   
                    
                    
                }
                
            }
        }
    }
    
    
}


struct ScrollViewExample_Preview:PreviewProvider {
    static var previews: some View{
        ScrollViewExample()
    }
    
}
