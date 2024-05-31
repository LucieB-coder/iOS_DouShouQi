//
//  PlayerPage.swift
//  DouShouQi
//
//  Created by Thomas Chazot on 16/05/2024.
//

import SwiftUI
import ChtuluDSQ

struct PlayerPage: View {
    let user: User
    let finishedGames: [FinishedGame]
    let users: [User]
    var body: some View {
        VStack(spacing: 20) {
            // Photo de profil et nom de l'utilisateur
            HStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding()
                
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(.largeTitle)
                        .bold()
                    Text("Username123")
                        .font(.title3)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding(.horizontal)
            
            HStack {
                PlayerDataComponent(boldData: "\(user.score)", smallData: "Points")
                Spacer()
                PlayerDataComponent(boldData: "\(user.wins + user.looses + user.draws)", smallData: "Parties")
                Spacer()
                PlayerDataComponent(boldData: "\(CGFloat(user.wins)/CGFloat(user.wins + user.looses + user.draws)*100)%", smallData: "Victoire")
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading) {
                Text("Dernières Parties")
                    .font(.headline)
                    .padding(.leading)
                ForEach(StubHistoric.getHistoric().sorted(by: {$0.date < $1.date }).filter({ $0.player1Id == user.id || $0.player2Id == user.id}), id:\.self){ game in
                    HistoricComponent(finishedGame: game, user: user, opponent: users.first(where: { $0.id != user.id && ($0.id == game.player1Id || $0.id == game.player2Id) }))
                        .padding(.vertical, 5)
                }
            }
            Spacer()
        }
        .padding()
    }
}

struct PlayerPage_Previews: PreviewProvider{
    static var previews: some View{
        PlayerPage(user: StubUser.getUsers()[3], finishedGames: StubHistoric.getHistoric(), users: StubUser.getUsers())
    }
}
