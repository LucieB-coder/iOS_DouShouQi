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
    
    public var cellPosition: CGPoint{
        didSet {
            self.position.x = SpriteMeeple.offset.x + SpriteMeeple.direction.dx*cellPosition.x
            self.position.y = SpriteMeeple.offset.y + SpriteMeeple.direction.dy*cellPosition.y
        }
    }
    
    init(imageNamed imageName : String){
        imageNode = SKSpriteNode(imageNamed: imageName)
        imageNode.size = CGSize(width: 90, height: 90)
        
        ellipseNode = SKShapeNode(ellipseOf: CGSize(width: 100, height: 100))
        ellipseNode.fillColor = .pinkPrimary
        
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
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        var x: CGFloat = 0
        var y: CGFloat = 0
        let position = touches.first?.location(in: parent!) ?? CGPoint(x:0, y: 0)
        if (position.x < -400){
            x = -400
        }
        else if (position.x > 500){
            x = 500
        }
        else{
            x = (abs(x.truncatingRemainder(dividingBy: 100)) < 50) ? floor(position.x/100) * 100 : ceil(position.x/100) * 100
        }
        if (position.y < -300){
            y = -300
        }
        else if (position.y > 400){
            y = 400
        }
        else{
            y = (abs(y.truncatingRemainder(dividingBy: 100)) < 50) ? floor(position.y/100) * 100 : ceil(position.y/100) * 100
        }
        
        self.position = CGPoint(x: x, y: y)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.position = touches.first?.location(in: parent!) ?? CGPoint(x:0, y: 0)
        
    }
    
}
