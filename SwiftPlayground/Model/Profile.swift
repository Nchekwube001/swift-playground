//
//  Profile.swift
//  SwiftPlayground
//
//  Created by francis on 28/05/2025.
//

import SwiftUI


struct Profile:Identifiable{
    var id = UUID().uuidString
    var userName:String
    var profilePicture:String
    var lastMessage:String
    var lastActive:String
    
}


var profiles =  [
    Profile(userName: "Mary Webster", profilePicture: "Image1", lastMessage: "Hey Stranger", lastActive: "9:35 AM"),
    Profile(userName: "Ryan Bakker", profilePicture: "Image2", lastMessage: "Pick Up!!!", lastActive: "7:21 PM"),
    Profile(userName: "Mario Wolf", profilePicture: "Image3", lastMessage: "Nice Profile", lastActive: "2:40 AM"),
    Profile(userName: "Jan Luigi", profilePicture: "Image4", lastMessage: "Good Morning", lastActive: "11:39 PM"),
]
