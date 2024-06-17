//
//  GameOver.swift
//  DouShouQi
//
//  Created by etudiant on 6/17/24.
//

import SwiftUI

struct GameOver: View {
    @Binding public var winnerName : String
    @Binding public var isShowingGameView: Bool
    
    var body: some View {
        HStack{
            Spacer()
            VStack(){
                Spacer()
                Text("\(winnerName) won").font(.title)
                Button(action: {
                    isShowingGameView = false
                }) {
                    HStack {
                        Text(LocalizedStringKey("NEW GAME"))
                            .font(.title2)
                            .fontWeight(.black)
                            .foregroundStyle(.white)
                            
                    }
                    .frame(width: 300, height: 70)
                    .background(Colors.primary)
                    .cornerRadius(20)
                    .padding(.top, 15)
                }
                Spacer()
            }
            Spacer()
        }
        
    }
}

