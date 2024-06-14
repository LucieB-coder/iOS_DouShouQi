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
        board.addMeepleOnTheBoard(modele3d: "3dModels/pancakes", position: SIMD3<Float>(x: 0.1, y: 0.0, z: 0.1))
        return board
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
     
}
