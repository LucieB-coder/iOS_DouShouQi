//
//  FinishedGame.swift
//  ChtuluDSQ
//
//  Created by Thomas Chazot on 28/05/2024.
//

import Foundation

public struct FinishedGame: Hashable, Equatable {
    
    public let player1Id: Int
    public let player2Id: Int
    public let winner: Int?
    
    public init(player1Id: Int, player2Id: Int, winner: Int? = nil){
        self.player1Id = player1Id
        self.player2Id = player2Id
        self.winner = winner
    }

}
