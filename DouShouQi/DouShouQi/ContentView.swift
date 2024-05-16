//
//  ContentView.swift
//  DouShouQi
//
//  Created by etudiant on 5/16/24.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.background
    }
    var body: some View {
        TabView {
            Text("Page d'accueil")
                .tabItem {
                    Image(systemName: "house")
                    Text("Accueil")
                }
            Text("Page historique")
                .tabItem {
                    Image(systemName: "clock")
                    Text("Historique")
                }
            Text("Page classement")
                .tabItem {
                    Image(systemName: "star")
                    Text("Classement")
                }
            Text("Page Profil")
                .tabItem {
                    Image(systemName: "person")
                    Text("Profil")
                }
            Text("Menu")
                .tabItem {
                    Image(systemName: "line.3.horizontal")
                    Text("Menu")
                }
        }
        .accentColor(Colors.primary)
    }
}


#Preview {
    ContentView()
}

