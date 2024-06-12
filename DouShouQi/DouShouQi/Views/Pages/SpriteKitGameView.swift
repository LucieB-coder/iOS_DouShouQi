//
//  SpriteKitGameView.swift
//  DouShouQi
//
//  Created by etudiant on 5/22/24.
//

import SwiftUI
import SpriteKit
import DouShouQiModel

struct SpriteKitGameView: View {
    
    @ObservedObject var gameViewModel: GameViewModel
    var gameScene : GameScene

    
    var body: some View {
        VStack(alignment: .center){
            Text(gameViewModel.playerTurn)
            Text(gameViewModel.moveText)
            SpriteView(scene: gameScene)
            .task {
                try! await gameViewModel.game?.start()
            }
        }
    }
}



struct SpriteKitGameView_Previews: PreviewProvider {
    static var previews: some View {
        let gameViewModel: GameViewModel = try! GameViewModel(game: Game(withRules: ClassicRules(), andPlayer1: RandomPlayer(withName: "player1", andId: .player1)!, andPlayer2: RandomPlayer(withName: "Player2", andId: .player2)!))
        let gameScene = GameScene(size: CGSize(width: 940, height: 740), gameViewModel: gameViewModel)

        return SpriteKitGameView(gameViewModel: gameViewModel, gameScene: gameScene)
        
    }
}
