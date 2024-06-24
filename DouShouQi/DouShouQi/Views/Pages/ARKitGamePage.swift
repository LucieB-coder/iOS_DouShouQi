//
//  GamePage.swift
//  DouShouQi
//
//  Created by etudiant on 6/17/24.
//

import SwiftUI
import DouShouQiModel

struct ARKitGamePage: View {
    @ObservedObject public var arGameViewModel: ARGameViewModel
    @Binding public var isShowingGameView: Bool
    
    public var body: some View {
        ZStack(alignment: .topLeading){
            QuitGameButton(isShowingGameView: self.$isShowingGameView)
            BoardViewRepresentable(arGameViewModel: arGameViewModel)
                .zIndex(1)
                .sheet(isPresented: self.$arGameViewModel.isGameOver) {
                    GameOver(winnerName: self.$arGameViewModel.playerTurn, isShowingGameView: self.$isShowingGameView)
                    .background(
                        LinearGradient(colors: [Color.pink, Color.purple], startPoint: .bottomLeading, endPoint: .topTrailing)
                    )
                }
            
        }
        .ignoresSafeArea()
    }
}


