//
//  GamePage.swift
//  DouShouQi
//
//  Created by etudiant on 6/17/24.
//

import SwiftUI
import DouShouQiModel

struct GamePage: View {
    @ObservedObject public var gameViewModel: GameViewModel
    @Binding public var isShowingGameView: Bool
    
    public var body: some View {
        ZStack(alignment: .topLeading){
            QuitGameButton(isShowingGameView: self.$isShowingGameView)
            SpriteKitGameView(gameViewModel: gameViewModel)
                .zIndex(1)
                .sheet(isPresented: self.$gameViewModel.isGameOver) {
                    GameOver(winnerName: self.$gameViewModel.playerTurn, isShowingGameView: self.$isShowingGameView)
                    .background(
                        LinearGradient(colors: [Color.pink, Color.purple], startPoint: .bottomLeading, endPoint: .topTrailing)
                    )
                }
            
        }
        .ignoresSafeArea()
    }
}


