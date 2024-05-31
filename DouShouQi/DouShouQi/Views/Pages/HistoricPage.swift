//
//  HistoricPage.swift
//  DouShouQi
//
//  Created by Chloé MOURGAND on 27/05/2024.
//

import SwiftUI

struct HistoricPage: View {
    var games : [String] //changer pour un type model game
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                List(games,id:\.self){ game in
                      HistoricComponent(name: "", result: "", date: "")
                }.navigationTitle("Historic")
            }
        }
    }
    
    struct HistoricPage_Previews: PreviewProvider {
        static var previews: some View {
            HistoricPage(games: ["game1","game2"])
        }
    }
}
