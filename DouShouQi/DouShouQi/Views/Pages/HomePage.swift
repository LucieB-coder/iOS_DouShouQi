//
//  HistoricPage.swift
//  DouShouQi
//
//  Created by Chloé MOURGAND on 16/05/2024.
//

import SwiftUI
import DouShouQiModel

struct HomePage: View {
    var game : [String]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("Pursue a game").font(.title).padding(.horizontal).padding(.bottom,0).padding(.top,10)
                List(game, id: \.self) { game in
                    NavigationLink(value: game) {
                        UnfinishedGameComponent(opponentName: "", date: "")
                }.padding(.top,0)
                }
                .listStyle(DefaultListStyle())
                .navigationTitle("Home")
                .navigationDestination(for: String.self) { game in
                    SpriteKitGameView(gameViewModel: try! GameViewModel(game: Game(withRules: ClassicRules(), andPlayer1: IAPlayer(withName: "player1", andId: .player1)!, andPlayer2: IAPlayer(withName: "Player2", andId: .player2)!)), gameScene: GameScene(size: CGSize(width: 940, height: 740), gameViewModel: nil))
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
