//
//  MatchedGeometry.swift
//  SwiftPlayground
//
//  Created by francis on 28/05/2025.
//

import SwiftUI

struct MatchedGeometry: View {
    var body: some View {
        NavigationStack{
            List{
                ForEach(profiles){ profile in
                    
                    HStack(spacing:15){
                        ImageView(profile: profile, size: 60)
                        VStack(alignment: .leading,spacing: 2){
                            Text(profile.userName)
                                .fontWeight(.semibold)
                            Text(profile.lastMessage)
                                .font(.callout)
                                .textScale(.secondary)
                                .foregroundStyle(.gray)
                           
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(profile.lastActive)
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    
                }
            }.navigationTitle("Profile")
            
        }
//        .overlayPreferenceValue(MAnchorKey.self) { value in
//        
//            GeometryReader{ geometry in
//                    ForEach(profiles){ profile in
//                        // Fetching each profile image using the profile ID
//                        
//                        if let anchor = value[profile.id]{
//                            let rect = geometry[anchor]
//                            ImageView(profile: profile, size: rect.size)
//                                .offset(x:rect.minX, y: rect.minY)
//                        }
//                    }
//                    
//                }
//                
//        
//        }
    }
}

struct ImageView:View {
    var profile:Profile
    var size: CGFloat
    
    var body: some View{
        Image(profile.profilePicture)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: size, height: size)
            .clipShape(.circle)
    }
}

#Preview {
    MatchedGeometry()
}
