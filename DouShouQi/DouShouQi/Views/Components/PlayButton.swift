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
            Text(LocalizedStringKey("PLAY"))
                .font(.title2)
                .fontWeight(.black)
                .foregroundStyle(.white)
                
        }
        .frame(width: 350, height: 70)
        .background(Colors.primary)
        .cornerRadius(20)
        .padding(.bottom, 15)
    }
}

struct PlayButton_Previews: PreviewProvider{
    static var previews: some View{
        PlayButton()
    }
}
