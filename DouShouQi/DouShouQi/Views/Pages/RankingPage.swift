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
    @State private var selectedPlayer: String?
    var body: some View {
        NavigationSplitView {
                    List(players, id: \.self) { player in
                        NavigationLink(value: player) {
                            RankingComponent(name: player)
                        }
                    }
                    .navigationTitle("Players")
                    .navigationDestination(for: String.self) { player in
                        PlayerPage()
                    }
                } detail: {
                    if let selectedPlayer = selectedPlayer {
                            PlayerPage()
                    } else {
                        Text("Pick a player")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                    }
                }
    }
}

#Preview {
    RankingPage(players: ["Chloé", "Lucie", "Thomas"])
}
