//
//  GameViewModel.swift
//  DouShouQi
//
//  Created by Thomas Chazot on 04/06/2024.
//

import Foundation
import SwiftUI
import Combine
import UIKit
import DouShouQiModel

@MainActor class GameViewModel: ObservableObject{
    @Published var game: Game?
    @Published var playerTurn : String = ""
    @Published var moveText : String = ""
    
    public init(game: Game?) {
        self.game = game
        self.game?.addPlayerNotifiedListener(playerTurn)
        self.game?.addMoveChosenCallbacksListener(moveChosen)
        self.game?.addInvalidMoveCallbacksListener(invalideMoveChosen)
        self.game?.addBoardChangedListener(boardChanged)
    }
    
    
    @MainActor func playerTurn(board: Board, player: Player) async{
        playerTurn = "\(player.name)"
        if (player is IAPlayer){
            do{
                _ = try await player.chooseMove(in: board, with: self.game!.rules)
            }
            catch{

            }
        }
    }
    
    @MainActor func moveChosen(board: Board, move: Move, player: Player) -> Void{
        playerTurn = "Move played"
        moveText = "Player \(player.id == .player1 ? "🟡 1" : "🔴 2") - \(player.name), has chosen: \(move)"
    }
    
    @MainActor func boardChanged(board: Board){
        _ = board
    }
    
    @MainActor func invalideMoveChosen(board: Board, move: Move, player: Player, result: Bool) {
        if result {
            return
        }
        /*
        print("**************************************")
        print("⚠️⚠️⚠️⚠️ Invalid Move detected: \(move) by \(player.name) (\(player.id))")
        print("**************************************")
         */
    }
    
    
    
    public func moveMeeple(startX: Int, startY: Int, newX: Int, newY: Int, owner: Owner, player: Player) async{
        
    }
}

