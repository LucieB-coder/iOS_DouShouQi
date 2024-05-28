//
//  PlayerDataComponent.swift
//  DouShouQi
//
//  Created by Chloé MOURGAND on 27/05/2024.
//

import SwiftUI

struct PlayerDataComponent : View {
    
    var boldData : String
    var smallData : String
    var body: some View {
        VStack {
            Text(boldData)
                .font(.title)
                .bold()
            Text(smallData)
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}

struct PlayerDataComponent_Previews: PreviewProvider {
    static var previews: some View {
        PlayerDataComponent(boldData: "1300", smallData: "nuclear missiles")
    }
}
