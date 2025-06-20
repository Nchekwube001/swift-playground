//
//  MAnchorKey.swift
//  SwiftPlayground
//
//  Created by francis on 28/05/2025.
//

import SwiftUI


// For reading source and destination view bounds for the custom matched geometry
struct MAnchorKey: PreferenceKey {
    static var defaultValue: [String: Anchor<CGRect>] = [:]
    static func reduce(value:inout [String: Anchor<CGRect>], nextValue: ()-> [String: Anchor<CGRect>]) {
        value.merge(nextValue()){
            $1
        }
    }
}
