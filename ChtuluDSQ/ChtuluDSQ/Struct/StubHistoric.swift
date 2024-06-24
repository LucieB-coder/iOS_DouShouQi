//
//  StubHistoric.swift
//  ChtuluDSQ
//
//  Created by Thomas Chazot on 28/05/2024.
//

import Foundation

public struct StubHistoric{
    
    public static func getHistoric() -> [FinishedGame]{
        let finishedGames: [FinishedGame] = [
            FinishedGame(player1Id: 1, player2Id: 4, winner: 1, date: Date()),
            FinishedGame(player1Id: 1, player2Id: 4, winner: 1, date: Date()),
            FinishedGame(player1Id: 2, player2Id: 4, winner: 2, date: Date()),
            FinishedGame(player1Id: 2, player2Id: 4, winner: 2, date: Date()),
            FinishedGame(player1Id: 2, player2Id: 4, winner: 2, date: Date()),
            FinishedGame(player1Id: 3, player2Id: 4, winner: 3, date: Date()),
            FinishedGame(player1Id: 3, player2Id: 4, date: Date()),
        ]
        
        return finishedGames
    }
}
