//
//  BoardAnchor.swift
//  AR_Doushouqi
//
//  Created by Chloé MOURGAND on 14/06/2024.
//

import Foundation
import RealityKit
import ARKit

class BoardAnchorEntity : AnchorEntity {
    init() {
            super.init(.plane(.horizontal, classification: .any, minimumBounds: SIMD2<Float>(0.2, 0.2)))
            addBoardModel()
        }
        
        required init(anchor: ARAnchor) {
            super.init(anchor: anchor)
            addBoardModel()
        }
        
        private func addBoardModel() {
            let board = try? Entity.load(named: "board")
            if let board {
                addChild(board)
                board.scale = SIMD3<Float>(x: 0.3, y: 0.3, z: 0.3)
            }
        }
        
        func addPawn(at position: SIMD3<Float>) {
            let pawn = try? Entity.load(named: "pawn")
            if let pawn {
                pawn.position = position
                pawn.scale = SIMD3<Float>(x: 0.1, y: 0.1, z: 0.1) // Adjust the scale as needed
                addChild(pawn)
            }
        }

}
