//
//  BoardARView.swift
//  AR_Doushouqi
//
//  Created by Chloé MOURGAND on 12/06/2024.
//

import Foundation
import RealityKit
import ARKit

class BoardArView : ARView {
    
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
    
    func defineAnchors(){
        let anchor = AnchorEntity(world: .zero)
        scene.addAnchor(anchor)
    }
    
    func addBoardToTheFloor(){
        let anchor = AnchorEntity(.plane(.horizontal, classification: .any, minimumBounds: SIMD2<Float>(0.2, 0.2)))
        scene.addAnchor(anchor)
        let board = try? Entity.load(named: "pancakes")
        if let board {
            anchor.addChild(board)
        }
    }


    
}
