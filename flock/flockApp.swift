//
//  flockApp.swift
//  flock
//
//  Created by Jack O'Donnell on 6/20/23.
//

import SwiftUI

@main
struct flockApp: App {
    var network = Network()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(network)
        }
    }
}
