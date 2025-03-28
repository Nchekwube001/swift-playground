//
//  LazyGrid.swift
//  SwiftPlayground
//
//  Created by francis on 28/03/2025.
//

import SwiftUI


struct LazyGrid:View {
    let columns = Array(repeating:  GridItem(.flexible()), count: 5)
    var body: some View {
        ScrollView{
            LazyVGrid(columns:columns,pinnedViews: .sectionHeaders){
                Section{
                    ForEach(MockColors.colors,id:\.self) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill($0.gradient)
                            .frame(height: 100)
                    }
                }header: {
                    Text("Favorite Colors")
                        .font(.largeTitle.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Section{
                    ForEach(MockColors.colors,id:\.self) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill($0.gradient)
                            .frame(height: 100)
                    }
                }header: {
                    Text("Honorable Mentions")
                        .font(.largeTitle.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }.padding()
    }
}



struct MockColors{
    static var colors:[Color]  {
        var array:[Color] = []
        
        for _ in 0..<30 {array.append(Color.random)}
        
        return array
    }
}
extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

#Preview {
    LazyGrid()
}
