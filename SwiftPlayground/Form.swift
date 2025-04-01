//
//  Form.swift
//  SwiftPlayground
//
//  Created by francis on 31/03/2025.
//

import SwiftUI

struct FormView : View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var age = ""
    @State private var sendNotifs = false
    @State private var noOfLikes = 1
    @State private var dob = Date()
    @State private var paths:[String] = []
    var body: some View {
        NavigationStack(path: $paths) {
            Form {
                Section(header: Text("Personal Information")){
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Age", text: $age)
                        .keyboardType(.numberPad)
                    DatePicker("Birth Date", selection: $dob, displayedComponents: .date)
                }
                Section(header: Text("Actions")){
                    Toggle("Send Notifications", isOn: $sendNotifs)
                        .toggleStyle(SwitchToggleStyle(tint: .black))
                    Stepper("Number of Likes", value: $noOfLikes, in : 1...100)
                    Text("This video has \(noOfLikes) likes")
                    
                    Link("Terms and conditions", destination: URL(string: "https://google.com")!)
                }
            }
         
            .navigationTitle("Account")
            .toolbar{
                ToolbarItemGroup(placement: .topBarTrailing){
                    Button{
                        hideKeyboard()
                    } label:{
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                    
                    
                    Button("Save", action:saveUser)
                } 
            }
        }
        .accentColor(.black)
       
    }
    func saveUser (){
        print("User saved!!")
    }
}


#Preview {
    FormView()
}



#if canImport(UIKit)

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
