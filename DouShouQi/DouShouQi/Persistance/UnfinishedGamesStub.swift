//
//  UnfinishedGameStub.swift
//  DouShouQi
//
//  Created by Chloé MOURGAND on 24/06/2024.
//

import Foundation
import DouShouQiModel

public struct UnfinishedGameStub{
    
    public static func getHistoric() -> [GameWithId] {
                    
        let grid: [[Cell]] = [
                [Cell(ofType: .jungle, ownedBy: .player1, withPiece: Piece(withOwner: .player1, andAnimal: .lion)),
                     Cell(ofType: .jungle, ownedBy: .noOne),
                     Cell(ofType: .trap, ownedBy: .noOne),
                     Cell(ofType: .den, ownedBy: .noOne),
                     Cell(ofType: .trap, ownedBy: .noOne),
                     Cell(ofType: .jungle),
                     Cell(ofType: .jungle, ownedBy: .player1, withPiece: Piece(withOwner: .player1, andAnimal: .tiger))],
                    [Cell(ofType: .jungle),
                     Cell(ofType: .jungle, ownedBy: .player1, withPiece: Piece(withOwner: .player1, andAnimal: .dog)),
                     Cell(ofType: .jungle, ownedBy: .noOne),
                     Cell(ofType: .trap, ownedBy: .noOne),
                     Cell(ofType: .jungle),
                     Cell(ofType: .jungle, ownedBy: .player1, withPiece: Piece(withOwner: .player1, andAnimal: .cat)),
                     Cell(ofType: .jungle)],
                    [Cell(ofType: .jungle, ownedBy: .player1, withPiece: Piece(withOwner: .player1, andAnimal: .rat)),
                     Cell(ofType: .jungle),
                     Cell(ofType: .jungle, ownedBy: .player1, withPiece: Piece(withOwner: .player1, andAnimal: .wolf)),
                     Cell(ofType: .jungle),
                     Cell(ofType: .jungle, ownedBy: .player1, withPiece: Piece(withOwner: .player1, andAnimal: .leopard)),
                     Cell(ofType: .jungle),
                     Cell(ofType: .jungle)],
                    [Cell(ofType: .jungle),
                     Cell(ofType: .water),
                     Cell(ofType: .water),
                     Cell(ofType: .jungle),
                     Cell(ofType: .water),
                     Cell(ofType: .water),
                     Cell(ofType: .jungle)],
                    [Cell(ofType: .jungle),
                     Cell(ofType: .water),
                     Cell(ofType: .water),
                     Cell(ofType: .jungle),
                     Cell(ofType: .water),
                     Cell(ofType: .water),
                     Cell(ofType: .jungle, ownedBy: .player1, withPiece: Piece(withOwner: .player1, andAnimal: .elephant)),
                     ],
                    [Cell(ofType: .jungle),
                     Cell(ofType: .water),
                     Cell(ofType: .water),
                     Cell(ofType: .jungle),
                     Cell(ofType: .water),
                     Cell(ofType: .water),
                     Cell(ofType: .jungle)],
                    [Cell(ofType: .jungle, ownedBy: .player2, withPiece: Piece(withOwner: .player2, andAnimal: .rat)),
                     Cell(ofType: .jungle),
                     Cell(ofType: .jungle, ownedBy: .player2, withPiece: Piece(withOwner: .player2, andAnimal: .wolf)),
                     Cell(ofType: .jungle),
                     Cell(ofType: .jungle, ownedBy: .player2, withPiece: Piece(withOwner: .player2, andAnimal: .leopard)),
                     Cell(ofType: .jungle),
                     Cell(ofType: .jungle, ownedBy: .player2, withPiece: Piece(withOwner: .player2, andAnimal: .elephant))],
                    [Cell(ofType: .jungle),
                     Cell(ofType: .jungle, ownedBy: .player2, withPiece: Piece(withOwner: .player2, andAnimal: .dog)),
                     Cell(ofType: .jungle, ownedBy: .noOne),
                     Cell(ofType: .trap, ownedBy: .noOne),
                     Cell(ofType: .jungle),
                     Cell(ofType: .jungle, ownedBy: .player2, withPiece: Piece(withOwner: .player2, andAnimal: .cat)),
                     Cell(ofType: .jungle)],
                    [Cell(ofType: .jungle, ownedBy: .player2, withPiece: Piece(withOwner: .player2, andAnimal: .lion)),
                     Cell(ofType: .jungle, ownedBy: .noOne),
                     Cell(ofType: .trap, ownedBy: .noOne),
                     Cell(ofType: .den, ownedBy: .noOne),
                     Cell(ofType: .trap, ownedBy: .noOne),
                     Cell(ofType: .jungle),
                     Cell(ofType: .jungle, ownedBy: .player2, withPiece: Piece(withOwner: .player2, andAnimal: .tiger))]
                ]
        var games : [GameWithId] = []
        
        let myGame = try! Game(withBoard: Board(withGrid: grid)!, andRules: ClassicRules(), andPlayer1: HumanPlayer(withName: "Paulpatine", andId: Owner.player1)!, andPlayer2: HumanPlayer(withName: "LaCalvitie", andId: Owner.player2)!)
        
        games.append(GameWithId(id: 1, game: myGame))

        return games
    }
}
