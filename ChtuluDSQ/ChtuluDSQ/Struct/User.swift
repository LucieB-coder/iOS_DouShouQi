//
//  User.swift
//  ChtuluDSQ
//
//  Created by Thomas Chazot on 28/05/2024.
//

import Foundation

public struct User : Hashable, Equatable{
    public var name: String
    
    public let id: Int
    
    public let score: Int
    public let wins: Int
    public let looses: Int
    public let draws: Int
    
    public init(name: String, id: Int, score: Int, wins: Int, looses: Int, draws: Int){
        self.name = name
        self.id = id
        self.score = score
        self.wins = wins
        self.looses = looses
        self.draws = draws
    }
}
