//
//  SpriteKitGameView.swift
//  DouShouQi
//
//  Created by etudiant on 5/22/24.
//

import SwiftUI
import SpriteKit

struct SpriteKitGameView: View {
    var gameScene : GameScene = GameScene(size: CGSize(width: 1000, height: 800))
    
    var body: some View {
        SpriteView(scene: gameScene)
    }
//        .task {
//        try: await gameScene.game.start()
//    }
}

#Preview {
    SpriteKitGameView()
}
