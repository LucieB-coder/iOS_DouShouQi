//
//  DouShouQiApp.swift
//  DouShouQi
//
//  Created by etudiant on 5/16/24.
//

import SwiftUI


class ColorSchemeManager: ObservableObject {
    @Published var colorScheme: ColorScheme = .light // default to light

   init() {
       // Get the current system color scheme
       if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
           let userInterfaceStyle = windowScene.traitCollection.userInterfaceStyle
           colorScheme = userInterfaceStyle == .dark ? .dark : .light
       }
   }
}

@main
struct DouShouQiApp: App {
    @StateObject private var colorSchemeManager = ColorSchemeManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(colorSchemeManager)
                .preferredColorScheme(colorSchemeManager.colorScheme)
                .task {
                    MusicHelper.playLaunchAppMusic()
                }
            
        }
    }
}
