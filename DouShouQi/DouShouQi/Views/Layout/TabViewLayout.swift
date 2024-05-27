//
//  SwiftUIView.swift
//  DouShouQi
//
//  Created by etudiant on 5/21/24.
//

import SwiftUI

struct TabViewLayout: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Colors.background)
    }
    var body: some View {
        TabView {
            Text("Page accueil")
                .tabItem {
                    Image(systemName: "house")
                    Text("Accueil")
                }
            HistoricPage(games: ["game1","game2"])
                .tabItem {
                    Image(systemName: "clock")
                    Text("Historique")
                }
            RankingPage(players: ["Chloé", "Lucie", "Thomas"])
                .tabItem {
                    Image(systemName: "star")
                    Text("Classement")
                }

            MenuPage()
                .tabItem {
                    Image(systemName: "line.3.horizontal")
                    Text("Menu")
                }
        }
        .accentColor(Colors.primary)
    }
}

struct TabViewLayout_Previews: PreviewProvider {
    static var previews : some View {
        TabViewLayout()
    }
}
