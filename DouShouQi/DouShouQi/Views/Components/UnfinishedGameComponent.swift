//
//  HistoricComponent.swift
//  DouShouQi
//
//  Created by Chloé MOURGAND on 16/05/2024.
//

import SwiftUI

struct UnfinishedGameComponent: View {
    var date : String
    var player1Name: String
    var player2Name: String
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Image("board").resizable().aspectRatio(contentMode: .fit).frame(height: 100)
                VStack(alignment: .leading){
                    Text(date).padding(5)
                    Text("\(player1Name) VS \(player2Name)").padding(5)
                }
            }
            Spacer()
        }
    }
}

struct UnfinishedGameComponent_Previews: PreviewProvider {
    static var previews: some View {
        UnfinishedGameComponent(date: "21-05-2024", player1Name: "Pifou", player2Name: "Pif")
    }
}
