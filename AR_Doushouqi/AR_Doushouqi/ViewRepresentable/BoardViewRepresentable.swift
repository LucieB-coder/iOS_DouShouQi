//
//  BoardViewRepresentable.swift
//  AR_Doushouqi
//
//  Created by Chloé MOURGAND on 12/06/2024.
//

import Foundation
import SwiftUI
import RealityKit
import DouShouQiModel

struct BoardViewRepresentable : UIViewRepresentable {
    func makeUIView(context: Context) -> BoardARView {
        let board = BoardARView()
        let game = try! Game(withRules: ClassicRules(), andPlayer1: HumanPlayer(withName: "Test", andId: .player1)!, andPlayer2: HumanPlayer(withName: "Test", andId: .player2)!)
        let gameViewModel = GameViewModel(game: game, boardArView: board)
        gameViewModel.boardArView.displayBoard(game.board)
        
        Task{
            try! await gameViewModel.game!.start()
        }
        
        return gameViewModel.boardArView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
     
}
