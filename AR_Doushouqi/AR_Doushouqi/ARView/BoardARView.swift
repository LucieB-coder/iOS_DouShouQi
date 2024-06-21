//
//  BoardARView.swift
//  AR_Doushouqi
//
//  Created by Chloé MOURGAND on 12/06/2024.
//

import Foundation
import RealityKit
import ARKit
import DouShouQiModel


class BoardARView : ARView {
    
    var boardAnchor: AnchorEntity?
    
    var observers : [(HasCollision, Transform, Transform) async -> Void] = []

    @Published var pieces: [Owner : [Animal:HasCollision]] = [.player1 : [:], .player2 : [:]]
    
    var initialTransform: Transform = Transform()
    
    let caseSize: Double = 0.300 * 0.1145


    // Offset initial
    let initialXOffset: Double = 0.135
    let initialYOffset: Double = -0.105

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
        
        func addMeepleOnTheBoard(modele3d: String, position: SIMD3<Float>, owner: Owner, animal: Animal){
            let meeple = try? Entity.loadModel(named: modele3d)
            if let meeple {
                meeple.position = position
                meeple.scale = SIMD3<Float>(x: 0.3, y: 0.3, z: 0.3)
                meeple.generateCollisionShapes(recursive: true)
                boardAnchor?.addChild(meeple)
                self.installGestures([.all], for: meeple as Entity & HasCollision).forEach { gestureRecognizer in
                    gestureRecognizer.addTarget(self, action: #selector(handleGesture(_:)))
                }
                
            }
        }
        
        @objc private func handleGesture(_ recognizer: UIGestureRecognizer) {
            guard let translationGesture = recognizer as? EntityTranslationGestureRecognizer, let entity = translationGesture.entity else { return }
            switch translationGesture.state {
                case .began:
                    self.initialTransform = entity.transform
                case .ended:
                    let positions = entity.transform.translation
                                
                    let clampedX = min(max(positions.z, -0.135), 0.135)
                    let clampedY = min(max(positions.x, -0.105), 0.105)
   
                    //Pixels to case
                    var x_t = round(abs(initialXOffset - Double(clampedX)) * caseSize * 1000)
                    var y_t = round(abs(initialYOffset - Double(clampedY)) * caseSize * 1000)
                
                    x_t = min(x_t, 8)
                    y_t = min(y_t, 6)
                
                    print("\(x_t)/\(y_t)")
                                
                    let x_p = initialXOffset - x_t * caseSize
                    let y_p = initialYOffset + y_t * caseSize
                
                    print("\(x_p)/\(y_p)")
                
                    x_t = round(abs(initialXOffset - x_p) * caseSize * 1000)
                    y_t = round(abs(initialYOffset - y_p) * caseSize * 1000)
                
                    print("\(x_t)/\(y_t)")

                
                //await meepleMoved(meeple: entity, initialTransform: self.initialTransform, finalTransform: entity.transform)
             
                    entity.transform.translation.z = Float(x_p)
                    entity.transform.translation.x = Float(y_p)
            //entity.move(to: initialTransform, relativeTo: boardAnchor, duration: 1)
                 
                
             
            default:
                break
        }
    }
    
    func meepleMoved(meeple: HasCollision, initialTransform: Transform, finalTransform: Transform) async{
        for observer in self.observers{
            await observer(meeple, initialTransform, finalTransform)
        }
    }

    
}
