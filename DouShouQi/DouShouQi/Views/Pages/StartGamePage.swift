//
//  StartGamePage.swift
//  DouShouQi
//
//  Created by Thomas Chazot on 27/05/2024.
//

import SwiftUI

struct StartGamePage: View {
    
    @StateObject private var viewModel = StartGameViewModel()
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
            NavigationLink {
                SpriteKitGameView()
            } label: {
                PlayButton()
            }
        }
        .padding()
    }
}

struct StartGamePage_Previews: PreviewProvider {
    static var previews: some View {
        StartGamePage()
    }
}
