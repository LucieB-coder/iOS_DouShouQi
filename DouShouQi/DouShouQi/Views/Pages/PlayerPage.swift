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
                    VStack {
                        Text("1,234")
                            .font(.title)
                            .bold()
                        Text("Points")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    VStack {
                        Text("567")
                            .font(.title)
                            .bold()
                        Text("Parties")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    VStack {
                        Text("89%")
                            .font(.title)
                            .bold()
                        Text("Victoire")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Dernières Parties")
                        .font(.headline)
                        .padding(.leading)
                    
                    ForEach(0..<5) { index in
                        HistoricComponent()
                        .padding(.vertical, 5)
                    }
                }
            }
            .padding()
        }
    }
}

<<<<<<< HEAD
struct PlayerPage_Previews: PreviewProvider{
    static var previews: some View{
        PlayerPage()
    }
=======
#Preview {
    PlayerPage()
>>>>>>> f3df4cf (:sparkles: Ranking Page + Profil Page)
}
