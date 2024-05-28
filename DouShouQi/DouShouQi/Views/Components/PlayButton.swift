//
//  PlayModel.swift
//  DouShouQi
//
//  Created by etudiant on 5/27/24.
//

import SwiftUI

struct PlayButton: View {
    var body: some View {
        HStack {
            Text("JOUER").font(.title2).fontWeight(.black).foregroundStyle(.white)
        }
        .frame(width: 350, height: 70)
        .background(Colors.primary)
        .cornerRadius(20)
        .padding(.bottom, 15)
    }
}

#Preview {
    PlayButton()
}
