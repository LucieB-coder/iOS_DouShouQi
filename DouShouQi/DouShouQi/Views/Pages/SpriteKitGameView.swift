//
//  SpriteKitGameView.swift
//  DouShouQi
//
//  Created by etudiant on 5/22/24.
//

import SwiftUI
import SpriteKit

struct SpriteKitGameView: View {
    var gameScene : GameScene = GameScene(size: CGSize(width: 940, height: 740))
    
    var body: some View {
        VStack(alignment: .center){
            SpriteView(scene: gameScene)
        }
    }
//        .task {
//        try: await gameScene.game.start()
//    }
}

struct SpriteKitGameView_Previews: PreviewProvider {
    static var previews: some View {
        SpriteKitGameView()
    }
}
