//
//  RankingPage.swift
//  DouShouQi
//
//  Created by Thomas Chazot on 16/05/2024.
//

import SwiftUI
import DouShouQiModel
import ChtuluDSQ

struct RankingPage: View {
    var users: [User]
    var finishedGames: [FinishedGame]
    
    var body: some View {
        NavigationStack {
            List(users, id: \.self) { user in
                NavigationLink(value: user) {
                    RankingComponent(user: user, ranking: users)
                }
            }
            .navigationTitle("Ranking")
            .navigationDestination(for: User.self) { user in
                PlayerPage(user: user, finishedGames: finishedGames, users: users)
            }
        }
    }
}

struct RankingPage_Previews: PreviewProvider{
    static var previews: some View{
        RankingPage(users: StubUser.getUsers().sorted(by: {$0.score > $1.score}), finishedGames: StubHistoric.getHistoric())
    }
}
