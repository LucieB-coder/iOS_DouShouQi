//
//  TopProfileComponent.swift
//  DouShouQi
//
//  Created by Thomas Chazot on 21/05/2024.
//

import SwiftUI

struct TopProfileComponent: View {
    var body: some View {
        HStack(){
            Image(systemName: "person.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50.0, height: 50.0)
                .imageScale(.large)
            VStack(alignment: .leading){
                Grid(alignment: .leading){
                    GridRow {
                        Text("Nom du joueur")
                        .gridCellColumns(2) //
                    }
                    .padding(.bottom, 5)
                    GridRow {
                        Image(systemName: "house")
                        Text("Pays")
                    }
                }
            }
            Spacer()
            RankingPositionComponent(color: .yellow, number: 1, size: 50)
        }
    }
}

#Preview {
    TopProfileComponent()
}
