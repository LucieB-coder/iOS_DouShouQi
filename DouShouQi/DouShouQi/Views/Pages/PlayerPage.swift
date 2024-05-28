//
//  PlayerPage.swift
//  DouShouQi
//
//  Created by Thomas Chazot on 16/05/2024.
//

import SwiftUI

struct PlayerPage: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Photo de profil et nom de l'utilisateur
                HStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .padding()
                    
                    VStack(alignment: .leading) {
                        Text("Nom du Joueur")
                            .font(.largeTitle)
                            .bold()
                        Text("Username123")
                            .font(.title3)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.horizontal)
                
                // Statistiques de l'utilisateur
                HStack {
                    PlayerDataComponent(boldData: "1,234", smallData: "Points")
                    Spacer()
                    PlayerDataComponent(boldData: "567", smallData: "Parties")
                    Spacer()
                    PlayerDataComponent(boldData: "69%", smallData: "Victoire")
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Dernières Parties")
                        .font(.headline)
                        .padding(.leading)
                    
                    ForEach(0..<5) { index in
                        HistoricComponent(name: "Vector", result: "Victoire",date: "27-05-2024")
                        .padding(.vertical, 5)
                    }
                }
            }
            .padding()
        }
    }
}

struct PlayerPage_Previews: PreviewProvider{
    static var previews: some View{
        PlayerPage()
    }
}
