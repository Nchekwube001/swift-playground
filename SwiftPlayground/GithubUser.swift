//
//  NetworkCall.swift
//  SwiftPlayground
//
//  Created by francis on 03/04/2025.
//

import SwiftUI


struct GithubUser:Codable {
    let login:String
    let bio:String
    let avatarUrl:String
}

struct GithubUserView : View {
    
    @State private var user: GithubUser?
    @State private var userName: String = ""
    var body: some View {
        VStack{
            
            HStack{
                TextField("Enter a username", text: $userName)
                
                
                Button{
                    Task{
                        do{
                            user = try await   getUser(userName: userName)
                        }catch GHError.invalidUrl {
                            print("Invalid URL")
                        }catch GHError.invalidData {
                            print("Invalid Data")
                        }catch GHError.invalidResponse {
                            print("Invalid Response")
                        }catch{
                            print("An error occurred")
                        }
                    }
                }label: {
                    Text("Search")
                        .font(.custom("Inter-Regular", size: 16))
                }
                
            }
            
            AsyncImage(url: URL(string: user?.avatarUrl ?? "")){
                image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            } placeholder: {
                //                Circle()
                //                    .foregroundColor(.secondary)
                
            } .frame(width: 120,height: 120)
            
            Text(user?.login ?? "")
                .font(.custom("SharpGrotesk-Medium20", size: 16))
            Text(user?.bio ?? "")
                .font(.custom("Inter-Regular", size: 16))
            
            Spacer()
        }.padding()
        
    }
    
    
    func getUser(userName:String) async throws -> GithubUser {
        
        let endpoint = "https://api.github.com/users/\(userName)"
        
        guard let url = URL(string: endpoint) else {throw GHError.invalidUrl}
        
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse , response.statusCode ==  200 else{
            throw GHError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(GithubUser.self, from: data)
        }catch {
            throw GHError.invalidData
        }
    }
}





#Preview {
    GithubUserView()
}


enum GHError: Error{
    case invalidUrl
    case invalidResponse
    case invalidData
}
