//
//  HistoricComponent.swift
//  DouShouQi
//
//  Created by Thomas Chazot on 21/05/2024.
//

import SwiftUI

struct HistoricComponent: View {
    var name : String
    var result : String
    var date : String
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .padding(.leading)
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)
                Text(date)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text(result)
                .font(.headline)
                .foregroundColor(.green) // ou .red pour les défaites
                .padding(.trailing)
        }
    }
}

struct HistoricComponent_Previews: PreviewProvider{
    static var previews: some View{
        HistoricComponent(name: "Vector", result: "Victoire",date: "27-05-2024")
    }
}

