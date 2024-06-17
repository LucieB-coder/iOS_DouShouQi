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
    @ObservedObject var musicHelper = MusicHelper.getMusicHelper()
    var body: some View {
        VStack(alignment: .center){
            Text(gameViewModel.playerTurn)
            Text(gameViewModel.moveText)
            SpriteView(scene: gameViewModel.gameScene)
            .task {
                musicHelper.stopBackgroundMusic()
                try! await gameViewModel.game?.start()
            }
        }
    }
}



struct SpriteKitGameView_Previews: PreviewProvider {
    static var previews: some View {
        let gameScene = GameScene(size: CGSize(width: 940, height: 740))
        let gameViewModel: GameViewModel = try! GameViewModel(game: Game(withRules: ClassicRules(), andPlayer1: RandomPlayer(withName: "player1", andId: .player1)!, andPlayer2: RandomPlayer(withName: "Player2", andId: .player2)!), gameScene: gameScene)
        

        return SpriteKitGameView(gameViewModel: gameViewModel)
        
    }
}
