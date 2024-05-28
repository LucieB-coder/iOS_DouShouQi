//
//  HistoricPage.swift
//  DouShouQi
//
//  Created by Chloé MOURGAND on 16/05/2024.
//

import SwiftUI

struct HomePage: View {
    var game : [String]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                List(game, id: \.self) { game in
                    NavigationLink(value: game) {
                        UnfinishedGameComponent(gameType: "IA", date: "15-03-24")
                    }
                }
                .listStyle(DefaultListStyle())
                .navigationTitle("Menu")
                .navigationDestination(for: String.self) { game in
                    UnfinishedGameComponent(gameType: "IA", date: "15-03-24")
                }
                
                ZStack {
                    Rectangle()
                        .fill(Color(UIColor.systemGroupedBackground))
                        .frame(height: 100)
                    NavigationLink {
                        StartGamePage()
                    } label: {
                        PlayButton()
                    }
                }
            }
            .background(Color(UIColor.systemGroupedBackground))
        }
        .background(Color(UIColor.systemGroupedBackground))
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage(game: ["toto","titi"])
    }
}
