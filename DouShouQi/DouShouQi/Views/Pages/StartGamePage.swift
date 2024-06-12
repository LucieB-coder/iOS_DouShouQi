//
//  StartGamePage.swift
//  DouShouQi
//
//  Created by Thomas Chazot on 27/05/2024.
//

import SwiftUI
import DouShouQiModel

struct StartGamePage: View {
    
    @StateObject private var viewModel = StartGameViewModel()
    @State private var isShowingGameView = false

    var body: some View {
        VStack(alignment: .center){
            Text("Choose your players")
                .font(.title)
                .bold()
            Image("two-players")
                .resizable()
                .frame(width: 100, height: 100)
            HStack(alignment: .center){
                Text("Player \(1)")
                    .bold()
                ChoosePlayerComponent(viewModel: viewModel.player1ViewModel)
            }
            HStack(alignment: .top){
                Text("Player \(2)")
                    .bold()
                    .padding(.top, 20)
                
                ChooseOpponentComponent(viewModel: viewModel.player2ViewModel)
            }
            Spacer()
            Button(action: {
                isShowingGameView = true
            }) {
                PlayButton()
            }
            .fullScreenCover(isPresented: $isShowingGameView, content: {
                ZStack(alignment: .topLeading){
                    Button(action: {
                        isShowingGameView = false
                    }, label: {
                        HStack{
                            Image(systemName: "chevron.left")
                                .foregroundStyle(Colors.primary)
                            Text("Quit the game")
                                .foregroundStyle(Colors.primary)
                        }
                        .padding()                        
                    })
                    .zIndex(3)
                    SpriteKitGameView(gameViewModel: try! GameViewModel(game: Game(withRules: ClassicRules(), andPlayer1: RandomPlayer(withName: "player1", andId: .player1)!, andPlayer2: RandomPlayer(withName: "Player2", andId: .player2)!)), gameScene: GameScene(size: CGSize(width: 940, height: 740), gameViewModel: nil))
                        .zIndex(1)
                }
                .ignoresSafeArea()
            })
        }
        .padding()
    }
}

struct StartGamePage_Previews: PreviewProvider {
    static var previews: some View {
        StartGamePage()
    }
}
