//
//  BoardARView.swift
//  AR_Doushouqi
//
//  Created by Chloé MOURGAND on 12/06/2024.
//

import Foundation
import RealityKit
import ARKit

class BoardARView : ARView {
    
    var boardAnchor: AnchorEntity?
    
    required init(frame frameRect: CGRect) {
            super.init(frame: frameRect)
    }
    
    required init?(coder decoder: NSCoder) {
            fatalError("init(coder:) not implemented")
    }
    
    convenience init(){
        self.init(frame: UIScreen.main.bounds)
        self.addBoardToTheFloor()
    }
    
    func applyConfiguration(){
        let configuration = ARWorldTrackingConfiguration()
        session.run(configuration)
    }
    
    func addBoardToTheFloor(){
        boardAnchor = AnchorEntity(.plane(.horizontal, classification: .any, minimumBounds: SIMD2<Float>(0.2, 0.2)))
        if let boardAnchor = boardAnchor {
                    scene.addAnchor(boardAnchor)
                    let board = try? Entity.load(named: "board")
                    if let board {
                        boardAnchor.addChild(board)
                        board.scale = SIMD3<Float>(x: 0.3, y: 0.3, z: 0.3)
                    }
        }
    }
    
    func addMeepleOnTheBoard(modele3d: String, position: SIMD3<Float>){
        let meeple = try? Entity.loadModel(named: modele3d)
        if let meeple {
            meeple.position = position
            meeple.scale = SIMD3<Float>(x: 0.3, y: 0.3, z: 0.3)
            meeple.generateCollisionShapes(recursive: true)
            boardAnchor?.addChild(meeple)
            self.installGestures([.translation], for: meeple as Entity & HasCollision)
        }

    }

    
}
