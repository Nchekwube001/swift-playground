//
//  AnimatedBottomTabModel.swift
//  SwiftPlayground
//
//  Created by francis on 29/03/2025.
//

import Foundation


enum TabModel : String, CaseIterable {
    case home = "Home"
    case favorite = "Favorite"
    case cart = "Cart"
    case search = "Search"
    case setting = "Setting"
    
    
    
    
    var systemImage: String {
        switch self {
        case .home:
            return "house"
        case .favorite:
            return "heart"
        case .cart:
            return "cart"
        case .search:
            return "magnifyingglass"
        case .setting: 
            return "gearshape"
        }
    }
}
