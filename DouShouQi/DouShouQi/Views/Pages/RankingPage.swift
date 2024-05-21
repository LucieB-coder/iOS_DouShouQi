//
//  RankingPage.swift
//  DouShouQi
//
//  Created by Thomas Chazot on 16/05/2024.
//

import DouShouQiModel
import SwiftUI

struct RankingPage: View {
    var players: [String]
    var body: some View {
        NavigationStack {
            List(players, id: \.self) { player in
                NavigationLink(value: player) {
                    RankingComponent(name: player)
                }
            }
            .navigationTitle("Classement")
            .navigationDestination(for: String.self) { player in
                PlayerPage()
            }
        }
    }
}

struct RankingPage_Previews: PreviewProvider{
    static var previews: some View{
        RankingPage(players: ["Chloé", "Lucie", "Thomas"])
    }
}
