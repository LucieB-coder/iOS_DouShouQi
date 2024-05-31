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

class LanguageManager: ObservableObject {
    static let shared = LanguageManager()
        
        @Published var selectedLanguage: String = "en" {
            didSet {
                UserDefaults.standard.set(selectedLanguage, forKey: "SelectedLanguage")
                updateAppLanguage() // Update app's preferred language
                refreshFlag.toggle() // Toggle the flag when language changes
                 
            }
        }
        
        @Published var refreshFlag = false // Added refreshFlag
        
        private func updateAppLanguage() {
            UserDefaults.standard.set([selectedLanguage], forKey: "AppleLanguages") // Set preferred language
            UserDefaults.standard.synchronize() // Make sure changes are applied immediately
        }
}

@main
struct DouShouQiApp: App {
    @StateObject private var colorSchemeManager = ColorSchemeManager()
    @StateObject private var languageManager = LanguageManager.shared
        
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(colorSchemeManager)
                .environmentObject(languageManager)
                .preferredColorScheme(colorSchemeManager.colorScheme)
                .id(languageManager.refreshFlag) // Refresh the view when language changes
        }
    }
}
