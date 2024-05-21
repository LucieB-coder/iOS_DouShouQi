//
//  GridComponent.swift
//  DouShouQi
//
//  Created by Thomas Chazot on 21/05/2024.
//

import SwiftUI

struct GridComponent: View {
    var grid: [[String?]]
    var body: some View {
        VStack(spacing: 2) {
            ForEach(grid.indices, id: \.self) { row in
                HStack(spacing: 2) {
                    ForEach(grid[row].indices, id: \.self) { column in
                        TileComponent(tile: grid[row][column])
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.green)
                            .border(Color.black, width: 1)
                    }
                }
            }
        }
    }
}

struct GridComponent_Previews: PreviewProvider{
    static var previews: some View{
        GridComponent(grid: Array(repeating: Array(repeating: nil, count: 7), count: 9))
    }
}
