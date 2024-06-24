//
//  StartGameViewModel.swift
//  DouShouQi
//
//  Created by Thomas Chazot on 28/05/2024.
//

import SwiftUI
import Combine
import UIKit

@MainActor public class StartGameViewModel: ObservableObject{
    @Published var player1ViewModel = ChoosePlayerViewModel(playerName: "Player1")
    @Published var player2ViewModel = ChoosePlayerViewModel(playerName: "Player2", isBot: true)
}

