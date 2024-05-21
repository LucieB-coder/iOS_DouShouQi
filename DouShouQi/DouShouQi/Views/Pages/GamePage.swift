//
//  GameView.swift
//  DouShouQi
//
//  Created by Thomas Chazot on 21/05/2024.
//

import SwiftUI
import DouShouQiModel

struct GamePage: View {
    private var grid: [[String?]] = Array(repeating: Array(repeating: "😎", count: 7), count: 9)
    private var turn: Int = 0
    private var currentPlayer: String = "Joueur 1"
    
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Tour: \(turn)")
                    .font(.headline)
                    .foregroundColor(.white)
                    .bold()
                Text("À qui de jouer: \(currentPlayer)")
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color.pink)
            .cornerRadius(10)
            .padding()
            
            // Grille du jeu
            GridComponent(grid: grid)
                .aspectRatio(7/9, contentMode: .fit)
                .padding()
            Button(action: {

            }) {
                Text("Passer le tour")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
    }
}

struct GamePage_Previews: PreviewProvider{
    static var previews: some View{
        GamePage()
    }
}
