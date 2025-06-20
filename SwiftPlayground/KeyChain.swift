//
//  KeyChain.swift
//  SwiftPlayground
//
//  Created by francis on 20/06/2025.
//

import SwiftUI
import KeychainSwift


struct KeyChain: View {
    
    let keyChain = KeychainSwift()
    @State private var userPassword = ""
    var body: some View {
        Button(userPassword.isEmpty ? "No Password":userPassword) {
            keyChain.set("Lorem_Ipsum", forKey: "user_password")
        }
        .onAppear{
            userPassword = keyChain.get("user_password") ?? ""
//            if let keyValue = keyChain.get("user_password") {
//                   userPassword = keyValue
//                
//            }else {
//                userPassword =  ""
//            }
        }
    }
}

#Preview {
    KeyChain()
}
