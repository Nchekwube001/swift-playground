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
    @StateObject private var networkMonitor = NetworkMonitor()
    var body: some Scene {
        WindowGroup {
            ContentView()

//            MatchedGeometry()
//            LocationNotification()
//            InternetConnectivity()
//                .environment(\.isNetworkConnected, networkMonitor.isConnected)
//                .environment(\.connectionType, networkMonitor.connectionType)
        }
        .modelContainer(for: SwiftDataItem.self)
    }
}


