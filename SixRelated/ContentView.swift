//
//  ContentView.swift
//  SixRelated
//
//  Created by Allan Auezkhan on 11.05.2026.
//

import SwiftUI

@main
struct ContentView: App {
    @StateObject private var dataManager = DataManager()
    
    var body: some Scene {
        WindowGroup {
            AlbumsListView()
                .environmentObject(dataManager)
        }
    }
}
