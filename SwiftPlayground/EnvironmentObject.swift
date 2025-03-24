//
//  EnvironmentObject.swift
//  SwiftPlayground
//
//  Created by francis on 24/03/2025.
//

import SwiftUI


class UserData:ObservableObject {
    @Published var username = "UnekweFrancis"
}

struct EnvironmentObjectView:View {
    @StateObject var userData = UserData()
    var body : some View {
        NavigationStack{
            NavigationLink("Go To Child Screen 1 \(userData.username)", destination: Child1View())
        }.environmentObject(userData)
    }
}

struct Child1View:View {
    var body : some View {
        VStack{
            NavigationLink("Go To Child Screen 2", destination: Child2View())
        }
    }
}
struct Child2View:View {
    var body : some View {
        VStack{
            NavigationLink("Go To Child Screen 3", destination: Child3View())
        }
    }
}
struct Child3View:View {
    @EnvironmentObject var userData:UserData
    var body : some View {
        VStack{
            Text(" Screen #3 \(userData.username)")
        }
    }
}


#Preview {
    EnvironmentObjectView()
}
