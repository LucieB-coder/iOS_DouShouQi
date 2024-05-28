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
            VStack(alignment: .leading, spacing: 0) {
                Text("Continuer une partie").font(.title).padding(.horizontal).padding(.bottom,0).padding(.top,10)
                List(game, id: \.self) { game in
                    NavigationLink(value: game) {
                        UnfinishedGameComponent(gameType: "IA", date: "15-03-24")
                }.padding(.top,0)
                }
                .listStyle(DefaultListStyle())
                .navigationTitle("Accueil")
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
