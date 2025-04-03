//
//  SwiftPlaygroundApp.swift
//  SwiftPlayground
//
//  Created by francis on 23/03/2025.
//

import SwiftUI
import SwiftData

@main
struct SwiftPlaygroundApp: App {
    var body: some Scene {
        WindowGroup {
            ChartsView()
        }
        .modelContainer(for: SwiftDataItem.self)
    }
}
