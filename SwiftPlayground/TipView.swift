//
//  TipView.swift
//  SwiftPlayground
//
//  Created by francis on 07/04/2025.
//

import SwiftUI

struct TipView : View {
    var carDb = Dictionary<String,Int>()
    var carDb2 = [String:Int]()
    var body: some View {
        VStack{
            Menu{
                ControlGroup{
                    Button{
                        
                    }label: {
                        Image(systemName: "backward.end.fill")
                    }
                    Button{
                        
                    }label: {
                        Image(systemName: "play.fill")
                    }
                    Button{
                        
                    }label: {
                        Image(systemName: "forward.end.fill")
                    }
                }
                
                Button{
                    
                }label: {
                    Label("Favourites", systemImage: "heart")
                }
                Button{
                    
                }label: {
                    Label("Libraries", systemImage: "forward.end.fill")
                }
            } label: {
                Image(systemName: "ellipsis.circle")
            }.menuOrder(.fixed)
            
            
            
            
            
            List{
                Text("Your Sample Mail")
                    .swipeActions(edge: .leading){
                        Button("Pin", systemImage: "pin"){
                            
                        }.tint(.purple)
                    }
                    .swipeActions(edge: .trailing){
                        Button("Delete", systemImage: "trash"){
                            
                        }.tint(.red)
                        Button("Edit", systemImage: "pencil"){
                            
                        }.tint(.orange)
                    }
            }
        }
    }
}


#Preview {
    TipView()
}
