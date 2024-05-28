//
//  RankingComponent.swift
//  DouShouQi
//
//  Created by Thomas Chazot on 16/05/2024.
//

import SwiftUI
import ChtuluDSQ

struct RankingComponent: View {
    var user: User
    var ranking: [User]
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                RankingPositionComponent(color: .yellow, number: (ranking.firstIndex(of: user) ?? -1) + 1, size: 30)
                Image(systemName: "person.fill")
                    .imageScale(.large)
                Text(user.name)
                Spacer()
            }
            .padding(10)
        }
    }
}

struct RankingComponent_Previews: PreviewProvider{
    static var previews: some View{
        RankingComponent(user: StubUser.getUsers()[0], ranking: StubUser.getUsers().sorted(by: {$0.score > $1.score}))
    }
}
