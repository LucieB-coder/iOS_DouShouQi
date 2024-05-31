//
//  ResultComponent.swift
//  DouShouQi
//
//  Created by Chloé MOURGAND on 31/05/2024.
//

import SwiftUI

struct ResultComponent: View {
    var result : Int
    var body: some View {
        let text = result == 0 ? "Victoire" : result == 1 ? "Defaite" : "Neutre"
        let color : Color = result == 0 ? .green : result == 1 ? .red : .yellow
        Text(text)
            .font(.headline)
            .foregroundColor(color) // ou .red pour les défaites
            .padding(.trailing)    }
}

struct ResultComponent_Previews: PreviewProvider {
    static var previews: some View {
        ResultComponent(result: 2)
    }
}
