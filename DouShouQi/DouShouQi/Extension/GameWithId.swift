//
//  GameWithId.swift
//  DouShouQi
//
//  Created by Thomas Chazot on 24/06/2024.
//

import Foundation
import DouShouQiModel

public class GameWithId : Hashable{
    public var id: Int
    
    public var game: Game
    
    public static func == (lhs: GameWithId, rhs: GameWithId) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    
    init(id: Int, game: Game) {
        self.id = id
        self.game = game
    }
}
