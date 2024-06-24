//
//  ARGameViewModel.swift
//  AR_Doushouqi
//
//  Created by Thomas Chazot on 17/06/2024.
//

import Foundation
import Combine
import DouShouQiModel
import RealityKit
import ARKit
import AVFoundation


@MainActor class ARGameViewModel: ObservableObject{
    @Published var game: Game?
    @Published var boardArView: BoardARView
    @Published var isGameOver: Bool = false
    @Published var playerTurn : String = ""


    
    public init(game: Game?, boardArView: BoardARView) {
        self.boardArView = boardArView
        self.game = game
        
        self.game?.addPlayerNotifiedListener(playerTurn)
        self.game?.addMoveChosenCallbacksListener(moveChosen)
        self.game?.addInvalidMoveCallbacksListener(invalidMoveChosen)
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
    
    @MainActor func gameOver(board: Board, result: Result, player: Player?){
        let musicHelper = MusicHelper.getMusicHelper()
        musicHelper.playSound(filePath: "victory")
        isGameOver = true
    }
    
    @MainActor func moveChosen(board: Board, move: Move, player: Player) -> Void{
        
        let piece = board.grid[move.rowOrigin][move.columnOrigin]
        let meeples = boardArView.pieces[move.owner]
        let meeple = meeples?.first(where: {
            $0.key == piece.piece?.animal
        })
        let x_p = (Double(move.rowDestination) * BoardARView.caseSize + BoardARView.offset.x) * -1
        let y_p = Double(move.columnDestination) * BoardARView.caseSize - BoardARView.offset.y
        meeple?.value.transform.translation.z = Float(x_p)
        meeple?.value.transform.translation.x = Float(y_p)
    }
    
    @MainActor func boardChanged(board: Board){
        _ = board
    }
    
    @MainActor func invalidMoveChosen(board: Board, move: Move, player: Player, result: Bool) {
        if result {
            if let piece = board.grid[move.rowDestination][move.columnDestination].piece{
                let meeples = boardArView.pieces[piece.owner]
                let meeple = meeples?.first(where: {
                    $0.key == piece.animal
                })
                meeple?.value.removeFromParent()
                let musicHelper = MusicHelper.getMusicHelper()
                musicHelper.playSound(filePath: "minecraft-eat")
            }
            return
        }
        
        let x_p = (Double(move.rowOrigin) * BoardARView.caseSize + BoardARView.offset.x) * -1
        let y_p = Double(move.columnOrigin) * BoardARView.caseSize - BoardARView.offset.y
        let piece = board.grid[move.rowOrigin][move.columnOrigin]
        let meeples = boardArView.pieces[move.owner]
        let meeple = meeples?.first(where: {
            $0.key == piece.piece?.animal
        })
        meeple?.value.transform.translation.z = Float(x_p)
        meeple?.value.transform.translation.x = Float(y_p)
        
        let musicHelper = MusicHelper.getMusicHelper()
        musicHelper.playSound(filePath: "looser")
    }
    
    func subscribesToMeeple(){
        boardArView.observers.append(meepleMoved)
    }
    
    @MainActor func meepleMoved(meeple: HasCollision, xStart: Int, yStart: Int, xEnd: Int, yEnd: Int) async{
        let piece = game!.board.grid[xStart][yStart].piece
        
        guard piece != nil else{
            
            if let rowAndCol: (Int, Int) = findPieceByMeeple(meeple: meeple){
                let x_p = (Double(rowAndCol.0) * BoardARView.caseSize + BoardARView.offset.x) * -1
                let y_p = Double(rowAndCol.1) * BoardARView.caseSize - BoardARView.offset.y
                meeple.transform.translation.z = Float(x_p)
                meeple.transform.translation.x = Float(y_p)
            }
        
            return
        }
        let owner = piece!.owner
        let playerToPlay : Owner = self.game!.rules.getNextPlayer()
        let move: Move = Move(of: owner, fromRow: xStart, andFromColumn: yStart, toRow: xEnd, andToColumn: yEnd)
        if(playerToPlay != owner){
            invalidMoveChosen(board: game!.board, move: move, player: game!.players[playerToPlay]!, result: false)
            return
        }
        if let player: HumanPlayer = game?.players[owner] as? HumanPlayer{
            try! await player.chooseMove(move)
        } else {
            let player: HumanPlayer = game?.players[.player1] as! HumanPlayer
            try! await player.chooseMove(move)
        }
    }
    
    
    @MainActor func findPieceByMeeple(meeple: HasCollision) -> (Int, Int)?{
        for row in 0..<game!.board.nbRows {
            for col in 0..<game!.board.nbColumns {
                if let p = game!.board.grid[row][col].piece {
                    if ("\(p.animal)/\(p.owner)" == meeple.name){
                        return (row, col)
                    }
                }
            }
        }
        return nil
    }
     
}

