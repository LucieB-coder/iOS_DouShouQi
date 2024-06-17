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
import AVFoundation

@MainActor class GameViewModel: ObservableObject{
    @Published var game: Game?
    @Published var playerTurn : String = ""
    @Published var moveText : String = ""
    @Published var gameScene: GameScene
    @ObservedObject var musicHelper = MusicHelper.getMusicHelper()
    
    
    public init(game: Game?, gameScene: GameScene) {
        self.gameScene = gameScene
        self.game = game
        self.game?.addPlayerNotifiedListener(playerTurn)
        self.game?.addMoveChosenCallbacksListener(moveChosen)
        self.game?.addInvalidMoveCallbacksListener(invalideMoveChosen)
        self.game?.addBoardChangedListener(boardChanged)
        self.game?.addGameOverListener(gameOver)
        self.subscribesToMeeple()
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
        let meeples = gameScene.pieces[move.owner]
        let meeple = meeples?.first(where: {
            $0.key == piece.piece?.animal
        })
        meeple?.value.cellPosition = CGPoint(x: move.rowDestination, y: move.columnDestination)
    }
    
    @MainActor func gameOver(board: Board, result: Result, player: Player?){

        musicHelper.playSound(filePath: "victory")

    }
    
    @MainActor func boardChanged(board: Board){
        
    }
    
    @MainActor func invalideMoveChosen(board: Board, move: Move, player: Player, result: Bool) {
        if result {
            if let piece = board.grid[move.rowDestination][move.columnDestination].piece{
                // Delete le meeple
                let meeples = gameScene.pieces[player.id == .player1 ? .player2 : .player1]
                let meeple = meeples?.first(where: {
                    $0.key == piece.animal
                })
                meeple?.value.parent?.removeChildren(in: [meeple!.value])
                musicHelper.playSound(filePath: "minecraft-eat")

            }
            return
        }
        let piece = board.grid[move.rowOrigin][move.columnOrigin]
        let meeples = gameScene.pieces[move.owner]
        let meeple = meeples?.first(where: {
            $0.key == piece.piece?.animal
        })
        
        meeple?.value.cellPosition = CGPoint(x: move.rowOrigin, y: move.columnOrigin);
        musicHelper.playSound(filePath: "looser")

    }
    
    func subscribesToMeeple(){
        for meeple in gameScene.pieces[.player1]!{
            meeple.value.observers.append(meepleMoved)
        }
        for meeple in gameScene.pieces[.player2]!{
            meeple.value.observers.append(meepleMoved)
        }
    }
    
    @MainActor func meepleMoved(spriteMeeple: SpriteMeeple, xStart: Int, yStart: Int, xEnd: Int, yEnd: Int) async{
        let owner = game!.board.grid[xStart][yStart].piece!.owner
        let playerToPlay : Owner = self.game!.rules.getNextPlayer()
        let move: Move = Move(of: owner, fromRow: xStart, andFromColumn: yStart, toRow: xEnd, andToColumn: yEnd)
        if(playerToPlay != owner){
            invalideMoveChosen(board: game!.board, move: move, player: game!.players[playerToPlay]!, result: false)
            return
        }
        if let player: HumanPlayer = game?.players[owner] as? HumanPlayer{
            try! await player.chooseMove(move)
        } else {
            let player: HumanPlayer = game?.players[.player1] as! HumanPlayer
            try! await player.chooseMove(move)
        }
    }
    
}

