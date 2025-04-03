//
//  SwiftDataItem.swift
//  SwiftPlayground
//
//  Created by francis on 03/04/2025.
//

import Foundation
import SwiftData


@Model
class SwiftDataItem:Identifiable {
    
    var id:String
    var name:String
    
    
    init( name: String) {
        self.id = UUID().uuidString
        self.name = name
    }
    
}
