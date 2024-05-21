//
//  RankingPositionComponent.swift
//  DouShouQi
//
//  Created by Thomas Chazot on 16/05/2024.
//

import SwiftUI

struct RankingPositionComponent: View {
    var color: Color
    var number: Int
    var size: CGFloat
    var body: some View {
        Text("#" + "\(number)")
            .frame(width: size, height: size)
            .background(
                Rectangle()
                .fill(color)
                .cornerRadius(5)
            )
    }
}

#Preview {
    RankingPositionComponent(color: .yellow, number: 1, size: 30)
}
