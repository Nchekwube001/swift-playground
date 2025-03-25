//
//  FaceId.swift
//  SwiftPlayground
//
//  Created by francis on 25/03/2025.
//

import SwiftUI
import LocalAuthentication

struct FaceIdView:View {
    @State private var isAuthenticated = false
    @State private  var text = "Login Gee!"
    var body: some View {
        VStack{
            if(isAuthenticated){
                Text("Welcome Sensei")
            }else{
                Text(text)
                Button{
                    authenticate()
                }label: {
                    Text("Authenticate")
                }
            }
        }
    }
    
    func authenticate (){
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            let reason = "We need to authenticate you."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason){
                success, error in
                if let error{
                    print("Error: \(error)")
                    text = error.localizedDescription
                    return
                    
                }
                
                if success{
                    print("Authentication Successful")
                }else{
                    text = "Authentication Failed"

                }
                isAuthenticated = success 
            }
        }
    }
}


#Preview {
    FaceIdView()
}
