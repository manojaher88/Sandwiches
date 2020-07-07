//
//  SandwichesApp.swift
//  Shared
//
//  Created by admin on 6/28/20.
//

import SwiftUI

@main
struct SandwichesApp: App {
    @StateObject private var sandwichStore = SandwichStore(sandwiches: testData)
    
    var body: some Scene {
        WindowGroup {
            ContentView(sandwichStore: sandwichStore)
        }
    }
}
