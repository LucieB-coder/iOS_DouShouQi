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
        ScrollView{
            VStack(alignment: .leading) {
                Text("Historique des parties").bold().font(.title).padding()
                    .font(.title2).bold()
                    .padding(.leading)
                
                List {
                      Text("A List Item")
                      Text("A Second List Item")
                      Text("A Third List Item")
                  }
                Text("test")
            }
        }
    }
    
    struct HistoricPage_Previews: PreviewProvider {
        static var previews: some View {
            HistoricPage(games: ["game1","game2"])
        }
    }
}
