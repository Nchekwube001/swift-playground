//
//  BottomTabView.swift
//  SwiftPlayground
//
//  Created by francis on 29/03/2025.
//

import SwiftUI

struct BottomTabView : View {
    var body: some View {
        TabView{
            ScreenOne()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            ScreenTwo()
                .tabItem{
                    Image(systemName: "person")
                    Text("Account")
                }
            ScreenThree()
                .tabItem{
                    Image(systemName: "cart")
                    Text("Cart")
                }
        }
        .accentColor(.red)
    }
}













struct ScreenOne: View {
    var body: some View {
        Text("Hello Screen 1")
    }
}
struct ScreenTwo: View {
    var body: some View {
        Text("Hello Screen 2")
    }
}
struct ScreenThree: View {
    var body: some View {
        Text("Hello Screen 3")
    }
}


#Preview {
    BottomTabView()
}
