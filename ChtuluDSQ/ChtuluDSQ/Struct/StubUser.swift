//
//  StubUser.swift
//  ChtuluDSQ
//
//  Created by Thomas Chazot on 28/05/2024.
//

import Foundation

public struct StubUser{
    
    public static func getUsers() -> [User]{
        var users: [User] = [
            User(name: "Chloé", id: 1, score: 10, wins: 2, looses: 0, draws: 0),
            User(name: "Lulu", id: 2, score: 15, wins: 3, looses: 0, draws: 0),
            User(name: "Toto", id: 3, score: 5, wins: 1, looses: 0, draws: 1),
            User(name: "Pifou d'amour", id: 4, score: -12, wins: 0, looses: 6, draws: 1)
        ]
        
        return users
    }
}
