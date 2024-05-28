//
//  HistoricComponent.swift
//  DouShouQi
//
//  Created by Chloé MOURGAND on 16/05/2024.
//

import SwiftUI

struct UnfinishedGameComponent: View {
    //prendra une partie au final
    var opponentName : String
    var date : String
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Image("board").resizable().aspectRatio(contentMode: .fit).frame(height: 100)
                VStack(alignment: .leading){
                    Text(date).padding(5)
                    Text(opponentName).padding(5)
                }
            }
            Spacer()
        }
    }
}

struct UnfinishedGameComponent_Previews: PreviewProvider {
    static var previews: some View {
        UnfinishedGameComponent(opponentName: "Cloporte", date: "21-05-2024")
    }
}
