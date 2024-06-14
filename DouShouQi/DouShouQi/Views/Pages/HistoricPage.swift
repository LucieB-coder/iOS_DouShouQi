//
//  HistoricPage.swift
//  DouShouQi
//
//  Created by Chloé MOURGAND on 27/05/2024.
//

import SwiftUI
import ChtuluDSQ

struct HistoricPage: View {
    var games : [FinishedGame]
    var user : User
    var users : [User]
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                List(games.filter({$0.player1Id == user.id || $0.player2Id==user.id}),id:\.self){ game in
                    HistoricComponent(finishedGame: game, user: user, opponent: users.first(where: { $0.id != user.id && ($0.id == game.player1Id || $0.id == game.player2Id) }))
                }.navigationTitle("Historic")
            }
        }
    }
    
    struct HistoricPage_Previews: PreviewProvider {
        static var previews: some View {
            HistoricPage(games: StubHistoric.getHistoric(), user: StubUser.getUsers()[3], users: StubUser.getUsers())
            //HistoricPage(games: StubHistoric.getHistoric())
        }
    }
}
