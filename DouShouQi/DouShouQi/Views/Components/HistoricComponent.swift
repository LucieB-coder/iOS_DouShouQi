//
//  HistoricComponent.swift
//  DouShouQi
//
//  Created by Thomas Chazot on 21/05/2024.
//

import SwiftUI

struct HistoricComponent: View {
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .padding(.leading)
            
            VStack(alignment: .leading) {
                Text("Opponent Name")
                    .font(.headline)
                Text("Date du match")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text("Résultat")
                .font(.headline)
                .foregroundColor(.green) // ou .red pour les défaites
                .padding(.trailing)
        }
    }
}

<<<<<<< HEAD
struct HistoricComponent_Previews: PreviewProvider{
    static var previews: some View{
        HistoricComponent()
    }
}

=======
#Preview {
    HistoricComponent()
}
>>>>>>> f3df4cf (:sparkles: Ranking Page + Profil Page)
