//
//  AnimatedBottomTab.swift
//  SwiftPlayground
//
//  Created by francis on 29/03/2025.
//

import SwiftUI


struct AnimatedBottomTab:View {
    @State private var tabSelection = 1
    @Namespace private var animation
    var body: some View {
        TabView(selection:$tabSelection ){
            Screen1()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }.tag(1)
            Screen2()
                .tabItem{
                    Image(systemName: "person")
                    Text("Account")
                }.tag(2)
            Screen3()
                .tabItem{
                    Image(systemName: "cart")
                    Text("Cart")
                }.tag(3 )
            Screen4()
                .tabItem{
                    Image(systemName: "heart")
                    Text("Likes")
                }.tag(4)
            Screen5()
                .tabItem{
                    Image(systemName: "gearshape")
                    Text("Settings")
                }.tag(5)
        }
        .overlay(alignment: .bottom){
            AnimatedTabCustomView(tabSelection: $tabSelection,animation: animation)
        }
    }
}





struct Screen1: View {
    var body: some View {
        Text("Hello Screen 1")
    }
}
struct Screen2: View {
    var body: some View {
        Text("Hello Screen 2")
    }
}
struct Screen3: View {
    var body: some View {
        Text("Hello Screen 3")
    }
}
struct Screen4: View {
    var body: some View {
        Text("Hello Screen 4")
    }
}
struct Screen5: View {
    var body: some View {
        Text("Hello Screen 5")
    }
}


#Preview {
    AnimatedBottomTab()
}
