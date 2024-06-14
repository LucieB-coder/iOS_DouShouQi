//
//  HistoricComponent.swift
//  DouShouQi
//
//  Created by Thomas Chazot on 21/05/2024.
//

import SwiftUI
import ChtuluDSQ

struct HistoricComponent: View {
    var finishedGame: FinishedGame
    var user : User
    var opponent : User?
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .padding(.leading)
            
            VStack(alignment: .leading) {
                Text((opponent != nil) ? opponent!.name : "BOT")
                    .font(.headline)
                Text(finishedGame.date, format: .dateTime)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            ResultComponent(result: finishedGame.winner == nil ? 2 : finishedGame.winner == user.id ? 0 : 1 )
        }
    }
}

struct HistoricComponent_Previews: PreviewProvider{
    static var previews: some View{
        HistoricComponent(finishedGame: StubHistoric.getHistoric()[1], user: StubUser.getUsers()[3], opponent: StubUser.getUsers()[0])
    }
}

