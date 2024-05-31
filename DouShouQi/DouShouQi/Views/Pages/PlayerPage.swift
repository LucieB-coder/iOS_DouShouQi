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
    var body: some View {
        ScrollView {
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
                        Text("")
                            .font(.title3)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.horizontal)
                
                // Statistiques de l'utilisateur
                HStack {
                    PlayerDataComponent(boldData: "\(user.score)", smallData: "Points")
                    Spacer()
                    PlayerDataComponent(boldData: "\(user.wins + user.looses)", smallData: "Parties")
                    Spacer()
                    PlayerDataComponent(boldData: "", smallData: "Victories")
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Last games")
                        .font(.headline)
                        .padding(.leading)
                    
                    ForEach(0..<5) { index in
                        HistoricComponent(name: "", result: "",date: "")
                        .padding(.vertical, 5)
                    }
                }
            }
            .padding()
        }
    }
}

struct PlayerPage_Previews: PreviewProvider{
    static var previews: some View{
        PlayerPage(user: StubUser.getUsers()[3], finishedGames: StubHistoric.getHistoric())
    }
}
