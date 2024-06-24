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
    
    var observers : [(HasCollision, Int, Int, Int, Int) async -> Void] = []

    @Published var pieces: [Owner : [Animal:HasCollision]] = [.player1 : [:], .player2 : [:]]
    
    var initialTransform: Transform = Transform()
    
    static let caseSize: Double = 0.1145
    
    static let offset = CGPoint(x:-4 * caseSize, y: 3 * caseSize)



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
                        boardAnchor.scale = SIMD3<Float>(x: 0.3, y: 0.3, z: 0.3)
                        scene.addAnchor(boardAnchor)
                        let board = try? Entity.load(named: "board")
                        if let board {
                            boardAnchor.addChild(board)
                        }
            }
        }
        
    func addMeepleOnTheBoard(modele3d: String, x: Int, y: Int, owner: Owner, animal: Animal){
            let meeple = try? Entity.loadModel(named: modele3d)
            if let meeple {
                let x_p = (Double(x) * BoardARView.caseSize + BoardARView.offset.x) * -1
                let y_p = Double(y) * BoardARView.caseSize - BoardARView.offset.y
                let position = SIMD3<Float>(x: Float(y_p), y: 0.0, z: Float(x_p))
                meeple.position = position
                if owner == .player1 {
                    let initialRotationQuat = simd_quatf(angle: -.pi / 2, axis: simd_float3(1, 0, 0))
                    let rotationQuat180 = simd_quatf(angle: .pi, axis: simd_float3(0, 1, 0))
                    let combinedRotation = simd_mul(rotationQuat180, initialRotationQuat)
                    meeple.transform.rotation = combinedRotation
                }
                meeple.generateCollisionShapes(recursive: true)
                boardAnchor?.addChild(meeple)
                pieces[owner]![animal] = meeple
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
                    let iniX = self.initialTransform.translation.z
                    let iniY = self.initialTransform.translation.x
                
                    let clampedStartX = min(max(CGFloat(iniX), BoardARView.offset.x), -BoardARView.offset.x)
                    let clampedStartY = min(max(CGFloat(iniY), -BoardARView.offset.y), BoardARView.offset.y)
                
                    let x_start = round(abs(Double(clampedStartX) + BoardARView.offset.x) / BoardARView.caseSize )
                    let y_start = round(abs(Double(clampedStartY) + BoardARView.offset.y) / BoardARView.caseSize )
                                
                    let clampedX = min(max(CGFloat(positions.z), BoardARView.offset.x), -BoardARView.offset.x)
                    let clampedY = min(max(CGFloat(positions.x), -BoardARView.offset.y), BoardARView.offset.y)
   
                    //Pixels to case
                    let x_t = round(abs(Double(clampedX) + BoardARView.offset.x) / BoardARView.caseSize )
                    let y_t = round(abs(Double(clampedY) + BoardARView.offset.y) / BoardARView.caseSize )
        
                    Task{
                        await meepleMoved(meeple: entity, xStart: Int(x_start), yStart: Int(y_start), xEnd: Int(x_t), yEnd: Int(y_t))
                    }
            default:
                break
        }
    }
    
    func meepleMoved(meeple: HasCollision, xStart: Int, yStart: Int, xEnd: Int, yEnd: Int) async{
        for observer in self.observers{
            await observer(meeple, xStart, yStart, xEnd, yEnd)
        }
    }
    
    func displayBoard(_ board: Board) {
        for row in 0..<board.nbRows {
            for col in 0..<board.nbColumns {
                if let p = board.grid[row][col].piece {
                    self.addMeepleOnTheBoard(modele3d: "\(p.animal)", x: row, y: col, owner: p.owner, animal: p.animal)
                }
            }
        }
    }

    
}
