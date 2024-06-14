//
//  SpriteMipple.swift
//  DouShouQi
//
//  Created by etudiant on 5/22/24.
//

import Foundation
import SpriteKit


class SpriteMeeple : SKNode {
    
    static let offset = CGPoint(x:-400, y: -300)
    static let direction = CGVector(dx: 100, dy: 100)
    
    let imageNode: SKSpriteNode
    let ellipseNode: SKShapeNode
    
    var observers : [(SpriteMeeple, Int, Int, Int, Int) async -> Void] = []
    
    public var cellPosition: CGPoint{
        didSet {
            self.position.x = SpriteMeeple.offset.x + SpriteMeeple.direction.dx*cellPosition.x
            self.position.y = SpriteMeeple.offset.y + SpriteMeeple.direction.dy*cellPosition.y
        }
    }
    
    init(imageNamed imageName : String, ellipseColor: UIColor){
        imageNode = SKSpriteNode(imageNamed: imageName)
        imageNode.size = CGSize(width: 90, height: 90)
        
        ellipseNode = SKShapeNode(ellipseOf: CGSize(width: 100, height: 100))
        ellipseNode.fillColor = ellipseColor
        
        cellPosition = CGPoint(x: 0, y: 0)
        
        super.init()
        
        self.addChild(ellipseNode)
        self.addChild(imageNode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        imageNode = SKSpriteNode(imageNamed: "rat")
        ellipseNode = SKShapeNode(ellipseOf: CGSize(width: 100, height: 100))
        cellPosition = CGPoint(x: 0, y: 0)
        super.init(coder: aDecoder)
    }
    
    // ---------------- Touch event handlers ---------------- //
    
    override var isUserInteractionEnabled: Bool{
        set { }
        get { true }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.zPosition = 100;
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.zPosition = 1;
        if let parent = parent, let position = touches.first?.location(in: parent) {
            // Arrondir à la case la plus proche pour x et y
            let x = round(position.x / 100) * 100
            let y = round(position.y / 100) * 100

            // Assurer que les coordonnées sont dans les limites
            let clampedX = min(max(x, -400), 400)
            let clampedY = min(max(y, -300), 300)
            
            let newXPosition = (clampedX - SpriteMeeple.offset.x) / SpriteMeeple.direction.dx;
            let newYPosition = (clampedY - SpriteMeeple.offset.y) / SpriteMeeple.direction.dy;
            Task{
                await meepleMoved(xStart: Int(cellPosition.x), yStart: Int(cellPosition.y), xEnd: Int(newXPosition), yEnd: Int(newYPosition));
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.position = touches.first?.location(in: parent!) ?? CGPoint(x:0, y: 0)
        
    }
    
    
    func meepleMoved(xStart: Int, yStart: Int, xEnd: Int, yEnd: Int) async{
        for observer in self.observers{
            await observer(self, xStart, yStart, xEnd, yEnd)
        }
    }
    
}
