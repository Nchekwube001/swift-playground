//
//  ApiRequest.swift
//  SwiftPlayground
//
//  Created by francis on 25/03/2025.
//

import SwiftUI


struct Todo:Codable{
    var userId : Int
    var id: Int
    var title: String
    var completed : Bool
}

struct APiRequestView:View {
    @State private var Todos = [Todo]()
    @State var paths:[String] = []
    var body: some View {
        NavigationStack(path: $paths) {
            List(Todos,id: \.id ){
                item in
                HStack(alignment:.center){
                    Text(item.title)
                    //                Toggle(isOn: item.completed)
                }.padding(16)
                
            }.navigationTitle("Todos")
                .task {
                    await fetchData()
                }
        }
    }
    
    func fetchData() async {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos")else{
            print("An Error occurred while making request")
            return
        }
        
        // Fetch data from url
        
        do{
            let (data,_) = try await URLSession.shared.data(from: url)
            
            
            // Decode data
            if let decodeResponse = try? JSONDecoder().decode([Todo].self, from: data){
                Todos = decodeResponse
            }
        }catch{
            print("An Error occurred while decoding  request")

        }
    }
}


#Preview {
    APiRequestView()
}
