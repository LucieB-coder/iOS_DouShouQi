//
//  HistoricPage.swift
//  DouShouQi
//
//  Created by Chloé MOURGAND on 16/05/2024.
//

import SwiftUI
import DouShouQiModel

struct HomePage: View {
    @State var isShowingGameView = false

    var body: some View {

        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("Pursue a game").font(.title).padding(.horizontal).padding(.bottom,0).padding(.top,10)
                .navigationTitle("Home")
                
                List(UnfinishedGameStub.getHistoric(), id: \.self) { game in
                    UnfinishedGameComponent(date: "21-05-2024", player1Name: "\(game.game.players[.player1]!.name)", player2Name: "\(game.game.players[.player2]!.name)")
                        .onTapGesture {
                            isShowingGameView = true
                        }
                        .fullScreenCover(isPresented: $isShowingGameView, content: {
                            AnyView(GamePage(gameViewModel: GameViewModel(game: game.game, gameScene: GameScene(size: CGSize(width: 940, height: 740))), isShowingGameView: $isShowingGameView))
                        })
                }
                Spacer()

                
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
//        HomePage(game: ["toto","titi"])
        HomePage()
    }
}
