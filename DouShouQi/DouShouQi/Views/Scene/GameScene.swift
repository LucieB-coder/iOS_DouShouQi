//
//  GameScene.swift
//  DouShouQi
//
//  Created by etudiant on 5/22/24.
//

import Foundation
import SpriteKit
import DouShouQiModel

class GameScene : SKScene {
    var game: Game = try! Game(withRules: ClassicRules(), andPlayer1: RandomPlayer(withName: "Rory", andId: .player1)!, andPlayer2: RandomPlayer(withName: "Guillaume", andId: .player2)!)
    
    let pieces: [Owner : [Animal:SpriteMeeple]] = [
        .player1: [
            .rat: SpriteMeeple(imageNamed: "rat"),
            .cat: SpriteMeeple(imageNamed: "cat"),
            .dog: SpriteMeeple(imageNamed: "dog"),
            .wolf: SpriteMeeple(imageNamed: "wolf"),
            .leopard: SpriteMeeple(imageNamed: "leopard"),
            .lion: SpriteMeeple(imageNamed: "lion"),
            .tiger: SpriteMeeple(imageNamed: "tiger"),
            .elephant: SpriteMeeple(imageNamed: "elephant"),
        ],
        .player2: [
            .rat: SpriteMeeple(imageNamed: "rat-inv"),
            .cat: SpriteMeeple(imageNamed: "cat-inv"),
            .dog: SpriteMeeple(imageNamed: "dog-inv"),
            .wolf: SpriteMeeple(imageNamed: "wolf-inv"),
            .leopard: SpriteMeeple(imageNamed: "leopard-inv"),
            .lion: SpriteMeeple(imageNamed: "lion-inv"),
            .tiger: SpriteMeeple(imageNamed: "tiger-inv"),
            .elephant: SpriteMeeple(imageNamed: "elephant-inv"),
        ],
    ]
    
    let imageBoard: SKSpriteNode = SKSpriteNode(imageNamed: "board")
    
    override init(size: CGSize) {
        super.init(size: size)
        imageBoard.size = size
        self.scaleMode = .aspectFit
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.backgroundColor = .yellow
        
        self.addChild(imageBoard)
        
        for piece in pieces.flatMap({owner, pieces in pieces.values}) {
            self.addChild(piece)
        }
        
        displayBoard(game.board)
    }
    
    func displayBoard(_ board: Board) {
        for row in 0..<board.nbRows {
            for col in 0..<board.nbColumns {
                if let p = board.grid[row][col].piece, let sprite = pieces[p.owner]?[p.animal] {
                    sprite.cellPosition = CGPoint(x: row, y: col)
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
}
