//
//  QuitGameButton.swift
//  DouShouQi
//
//  Created by etudiant on 6/14/24.
//

import SwiftUI
import DouShouQiModel

public struct QuitGameButton: View {
    @State private var confirmationShown = false
    @Binding public var isShowingGameView: Bool
    
    public var body: some View {
        HStack{
            Button(
                action: { confirmationShown = true }
            ) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .foregroundStyle(Colors.primary)
                    .bold()
                Text("Quit the game")
                    .foregroundStyle(Colors.primary)
            }
            .confirmationDialog(
                "Quit the game",
                isPresented: $confirmationShown
            )
            {
                Button("Pursue the game later"){
                    // TODO
                }
                Button("Do not save the game") {
                    withAnimation {
                        self.isShowingGameView = false
                    }
                }
            }
            .padding(.top, 75)
            .padding(.horizontal, 5)
        }
        .zIndex(3)
    }
}


