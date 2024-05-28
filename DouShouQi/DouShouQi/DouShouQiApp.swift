//
//  DouShouQiApp.swift
//  DouShouQi
//
//  Created by etudiant on 5/16/24.
//

import SwiftUI

class ColorSchemeManager: ObservableObject {
    @Published var colorScheme: ColorScheme = .light
}

@main
struct DouShouQiApp: App {
    @StateObject private var colorSchemeManager = ColorSchemeManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.colorScheme, colorSchemeManager.colorScheme)
        }
    }
}
