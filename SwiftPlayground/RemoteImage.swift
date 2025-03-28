//
//  RemoteImage.swift
//  SwiftPlayground
//
//  Created by francis on 28/03/2025.
//

import SwiftUI

struct RemoteImage:View {
    let imageURLString = "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cG9ydHJhaXR8ZW58MHx8MHx8fDA%3D"
    var body: some View {
        AsyncImage(url: URL(string: imageURLString)){ image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 350,height: 350)
            
        }placeholder: {
            ProgressView()
        }
    }
}



#Preview {
    RemoteImage()
}
