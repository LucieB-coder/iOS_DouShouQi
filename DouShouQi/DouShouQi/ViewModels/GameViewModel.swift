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
    @Published var gameScene: GameScene
    
    public init(game: Game?, gameScene: GameScene) {
        self.gameScene = gameScene
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
        let piece = board.grid[move.rowOrigin][move.columnOrigin]
        let meeples = gameScene.pieces[player.id]
        let meeple = meeples?.first(where: {
            $0.key == piece.piece?.animal
        })
        meeple?.value.cellPosition = CGPoint(x: move.rowDestination, y: move.columnDestination)
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
    
    func subscribesToMeeple(){
        for meeple in gameScene.pieces[.player1]!{
            meeple.value.observers.append(meepleMoved)
        }
        for meeple in gameScene.pieces[.player1]!{
            meeple.value.observers.append(meepleMoved)
        }
    }
    
    @MainActor func meepleMoved(spriteMeeple: SpriteMeeple, xStart: Int, yStart: Int, xEnd: Int, yEnd: Int){
        let move: Move = Move(of: game!.board.grid[xStart][yStart].piece!.owner, fromRow: xStart, andFromColumn: yStart, toRow: xEnd, andToColumn: yEnd)
        if(game!.rules.isMoveValid(onBoard: game!.board, withMove: move)){
            let player: HumanPlayer = game?.players[.player1] as! HumanPlayer
            try! player.chooseMove(move)
        }
    }
}

