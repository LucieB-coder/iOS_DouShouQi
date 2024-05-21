//
//  HistoricPage.swift
//  DouShouQi
//
//  Created by Chloé MOURGAND on 16/05/2024.
//

import SwiftUI

struct HistoricPage: View {
    var game : [String]
    var body: some View {
        VStack{
            NavigationStack{
                List(game, id: \.self){
                    game in NavigationLink(value : game){
                        UnfinishedGameComponent(gameType: "IA", date: "15-03-24")
                    }
                }.navigationTitle("Historique")
                    .navigationDestination(for: String.self){
                        game in
                        UnfinishedGameComponent(gameType: "IA", date: "15-03-24")
                    }
            }
        }
        

    }
}

struct HistoricPage_Previews: PreviewProvider {
    static var previews: some View {
        HistoricPage(game: ["toto","titi"])
    }
}
