//
//  GeometryReader.swift
//  SwiftPlayground
//
//  Created by francis on 04/04/2025.
//

import SwiftUI

struct GeometryReader : View {
    var body: some View {
    
        NavigationStack{
            VStack{
                Rectangle()
                    .fill(.teal)

            }
            .navigationTitle("Geometry Reader")
        }
      
    }
}


#Preview {
    GeometryReader()
}
