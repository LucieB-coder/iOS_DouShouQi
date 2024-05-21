//
//  RankingComponent.swift
//  DouShouQi
//
//  Created by Thomas Chazot on 16/05/2024.
//

import SwiftUI

struct RankingComponent: View {
    var name: String
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                RankingPositionComponent(color: .yellow, number: 1, size: 30)
                Image(systemName: "person.fill")
                    .imageScale(.large)
                Text(name)
                Spacer()
            }
            .padding(10)
        }
    }
}

struct RankingComponent_Previews: PreviewProvider{
    static var previews: some View{
        RankingComponent(name: "Toto")
    }
}
