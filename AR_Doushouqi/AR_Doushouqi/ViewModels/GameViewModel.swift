//
//  GameViewModel.swift
//  AR_Doushouqi
//
//  Created by Thomas Chazot on 17/06/2024.
//

import Foundation
import Combine
import DouShouQiModel
import RealityKit
import ARKit

@MainActor class GameViewModel: ObservableObject{
    @Published var game: Game?
    @Published var playerTurn : String = ""
    @Published var moveText : String = ""
    @Published var boardArView: BoardARView
    
    public init(game: Game?, boardArView: BoardARView) {
        self.boardArView = boardArView
        self.game = game
        /*
        self.game?.addPlayerNotifiedListener(playerTurn)
        self.game?.addMoveChosenCallbacksListener(moveChosen)
        self.game?.addInvalidMoveCallbacksListener(invalideMoveChosen)
        self.game?.addBoardChangedListener(boardChanged)
        self.subscribesToMeeple()
         */
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
    /*
    @MainActor func moveChosen(board: Board, move: Move, player: Player) -> Void{
        let piece = board.grid[move.rowOrigin][move.columnOrigin]
        let meeples = boardArView.pieces[move.owner]
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
            if let piece = board.grid[move.rowDestination][move.columnDestination].piece{
                // Delete le meeple
                let meeples = boardArView.pieces[player.id == .player1 ? .player2 : .player1]
                let meeple = meeples?.first(where: {
                    $0.key == piece.animal
                })
                meeple?.value.parent?.removeChildren(in: [meeple!.value])
            }
            return
        }
        let piece = board.grid[move.rowOrigin][move.columnOrigin]
        let meeples = boardArView.pieces[move.owner]
        let meeple = meeples?.first(where: {
            $0.key == piece.piece?.animal
        })
        
        meeple?.value.cellPosition = CGPoint(x: move.rowOrigin, y: move.columnOrigin);
    }
    
    func subscribesToMeeple(){
        boardArView.observers.append(meepleMoved)
    }
    
    @MainActor func meepleMoved(meeple: HasCollision, initialTransform: Transform, finalTransform: Transform) async{
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
     */
}

