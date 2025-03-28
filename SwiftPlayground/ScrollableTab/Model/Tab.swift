//
//  Tab.swift
//  SwiftPlayground
//
//  Created by francis on 27/03/2025.
//

import SwiftUI

//Tabs

enum Tab: String, CaseIterable {
    case chats = "Chats"
    case calls = "Calls"
    case settings = "Settings"
    
    
    var systemInage:String {
        switch self{
        case .calls :
            return "phone"
        case .chats :
            return "bubble.left.and.bubble.right"
        case .settings :
            return "gear"
        }
    }
}
