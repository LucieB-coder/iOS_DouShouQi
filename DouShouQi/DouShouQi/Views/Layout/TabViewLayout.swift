//
//  SwiftUIView.swift
//  DouShouQi
//
//  Created by etudiant on 5/21/24.
//

import SwiftUI
import ChtuluDSQ

struct TabViewLayout: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemGroupedBackground
    }
    
    var body: some View {
        TabView {
            HomePage()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            HistoricPage(games: StubHistoric.getHistoric(), user: StubUser.getUsers()[3], users: StubUser.getUsers())
                .tabItem {
                    Image(systemName: "clock")
                    Text("Historic")
                }
            RankingPage(users: StubUser.getUsers().sorted(by: {$0.score > $1.score}), finishedGames: StubHistoric.getHistoric())
                .tabItem {
                    Image(systemName: "star")
                    Text("Ranking")
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
