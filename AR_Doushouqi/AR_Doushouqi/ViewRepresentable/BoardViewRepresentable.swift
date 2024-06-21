//
//  BoardViewRepresentable.swift
//  AR_Doushouqi
//
//  Created by Chloé MOURGAND on 12/06/2024.
//

import Foundation
import SwiftUI
import RealityKit

struct BoardViewRepresentable : UIViewRepresentable {
    func makeUIView(context: Context) -> BoardARView {
        let board = BoardARView()
        board.addMeepleOnTheBoard(modele3d: "lion", position: SIMD3<Float>(x: 0.105, y: 0.0, z: 0.135), owner: .player1, animal: .lion)
        board.addMeepleOnTheBoard(modele3d: "tiger", position: SIMD3<Float>(x: -0.105, y: 0.0, z: 0.135), owner: .player1, animal: .tiger)
        board.addMeepleOnTheBoard(modele3d: "cat", position: SIMD3<Float>(x: 0.105, y: 0.0, z: -0.135), owner: .player1, animal: .tiger)

        
        board.addMeepleOnTheBoard(modele3d: "wolf", position: SIMD3<Float>(x: -0.070, y: 0.0, z: 0.105), owner: .player1, animal: .wolf)
        
        board.addMeepleOnTheBoard(modele3d: "dog", position: SIMD3<Float>(x: 0.070, y: 0.0, z: 0.105), owner: .player1, animal: .dog)
        
        board.addMeepleOnTheBoard(modele3d: "lion", position: SIMD3<Float>(x: -0.105, y: 0.0, z: -0.135), owner: .player1, animal: .lion)

        
        return board
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
     
}
