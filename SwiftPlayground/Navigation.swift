//
//  Popover.swift
//  SwiftPlayground
//
//  Created by francis on 24/03/2025.
//

import SwiftUI


struct NavigationView: View {
    @State var paths:[String] = []
    var body: some View {
        NavigationStack(path: $paths){
            ScrollView{
                LazyVStack {
                    ForEach(0..<100){index in
                        ZStack{
                            LinearGradient(colors: [.red,.yellow], startPoint: .leading, endPoint: .trailing).cornerRadius(20)
                            Text("\(index+1)").font(.largeTitle)
                        }.frame(width:.infinity,height: 100).padding()
                       
                        
                        
                    }
                    
                }
            }.navigationTitle("Instagram")
                .toolbar(){
                    ToolbarItem(placement: .topBarLeading){
                        Image(systemName: "heart.fill")
                    }
                    ToolbarItem(placement: .topBarTrailing){
                        Image(systemName: "plus")
                    }
//                    ToolbarItem(placement:.topBarLeading){
//                        Image(Image(systemName: "heart.fill"))
//                    }
                }
        }
       
    }
}


#Preview {
    NavigationView()
}
