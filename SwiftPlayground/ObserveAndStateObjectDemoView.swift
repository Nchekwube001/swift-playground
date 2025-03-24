//
//  ObserveAndStateObjectDemoView.swift
//  SwiftPlayground
//
//  Created by francis on 24/03/2025.
//

import SwiftUI


class PlayerViewModel:ObservableObject {
    @Published var playernames:[String] = []
    init() {getDefaultPlayers()}
    
    func getDefaultPlayers(){
        playernames.append("Bukayo Saka")
        playernames.append("Gabriel Maghalaes")
    }
    func addNewName(_ name:String){
        playernames.append(name)
   
    }
}


struct ObserveAndStateObjectDemoView:View {
    @ObservedObject var viewModel:PlayerViewModel = PlayerViewModel() // Doesnt persist Data across rerenders
//    @StateObject var viewModel:PlayerViewModel = PlayerViewModel() -Persists Data across rerenders
    
    var body : some View {
        
        NavigationStack{
            List(viewModel.playernames,id:\.self){
                playerName in
                Text(playerName)
                
            }.navigationTitle("Arsenal FC Players")
                .toolbar(content: {
                    Button{
                        viewModel.addNewName("Martin Odegaard")
                    }label: {
                        Image(systemName: "plus")
                    }
                })
        }
    }
}

#Preview{
    ObserveAndStateObjectDemoView()
}
