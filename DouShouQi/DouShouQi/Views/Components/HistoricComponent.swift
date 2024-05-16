//
//  HistoricComponent.swift
//  DouShouQi
//
//  Created by Chloé MOURGAND on 16/05/2024.
//

import SwiftUI

struct HistoricComponent: View {
    var body: some View {
        VStack{
            HStack{
                Image("doushouqiSimpleBoard").resizable().aspectRatio(contentMode: .fit)
                VStack(alignment: .leading){
                    Text("date").padding(5)
                    Text("type jeu").padding(5)
                }
            }
            Spacer()
        }.frame(width: 200,height: 150)
    }
}

struct HistoricComponent_Previews: PreviewProvider {
    static var previews: some View {
        HistoricComponent()
    }
}
