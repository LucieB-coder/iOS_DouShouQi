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
    
    @Published var pieces: [Owner : [Animal:SpriteMeeple]] = [
        .player1: [
            .rat: SpriteMeeple(imageNamed: "rat", ellipseColor: UIColor(Colors.primary)),
            .cat: SpriteMeeple(imageNamed: "cat", ellipseColor: UIColor(Colors.primary)),
            .dog: SpriteMeeple(imageNamed: "dog", ellipseColor: UIColor(Colors.primary)),
            .wolf: SpriteMeeple(imageNamed: "wolf", ellipseColor: UIColor(Colors.primary)),
            .leopard: SpriteMeeple(imageNamed: "leopard", ellipseColor: UIColor(Colors.primary)),
            .lion: SpriteMeeple(imageNamed: "lion", ellipseColor: UIColor(Colors.primary)),
            .tiger: SpriteMeeple(imageNamed: "tiger", ellipseColor: UIColor(Colors.primary)),
            .elephant: SpriteMeeple(imageNamed: "elephant", ellipseColor: UIColor(Colors.primary)),
        ],
        .player2: [
            .rat: SpriteMeeple(imageNamed: "rat-inv", ellipseColor: UIColor(Colors.blueGreen)),
            .cat: SpriteMeeple(imageNamed: "cat-inv", ellipseColor: UIColor(Colors.blueGreen)),
            .dog: SpriteMeeple(imageNamed: "dog-inv", ellipseColor: UIColor(Colors.blueGreen)),
            .wolf: SpriteMeeple(imageNamed: "wolf-inv", ellipseColor: UIColor(Colors.blueGreen)),
            .leopard: SpriteMeeple(imageNamed: "leopard-inv", ellipseColor: UIColor(Colors.blueGreen)),
            .lion: SpriteMeeple(imageNamed: "lion-inv", ellipseColor: UIColor(Colors.blueGreen)),
            .tiger: SpriteMeeple(imageNamed: "tiger-inv", ellipseColor: UIColor(Colors.blueGreen)),
            .elephant: SpriteMeeple(imageNamed: "elephant-inv", ellipseColor: UIColor(Colors.blueGreen)),
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
