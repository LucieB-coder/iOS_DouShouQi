//
//  HistoricComponent.swift
//  DouShouQi
//
//  Created by Chloé MOURGAND on 16/05/2024.
//

import SwiftUI
import DouShouQiModel

struct UnfinishedGameComponent: View {
    //prendra une partie au final
    var game : Game
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Image("board").resizable().aspectRatio(contentMode: .fit).frame(height: 100)
                VStack(alignment: .leading){
                    Text(game.players.description).padding(5)
                }
            }
            Spacer()
        }
    }
}

struct UnfinishedGameComponent_Previews: PreviewProvider {
    static var previews: some View {
        UnfinishedGameComponent(game: UnfinishedGameStub.getHistoric()[1])
    }
}
