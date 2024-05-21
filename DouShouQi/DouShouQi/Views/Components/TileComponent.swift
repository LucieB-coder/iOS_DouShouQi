//
//  TileComponent.swift
//  DouShouQi
//
//  Created by Thomas Chazot on 21/05/2024.
//

import SwiftUI

struct TileComponent: View {
    let tile: String?
    var body: some View {
        if let animal = tile {
            Text(animal)
        } else {
            Color.clear
        }
    }
}

struct TileComponent_Previews: PreviewProvider{
    static var previews: some View{
        TileComponent(tile: "Test")
    }
}
