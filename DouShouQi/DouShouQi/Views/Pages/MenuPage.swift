//
//  SwiftUIView.swift
//  DouShouQi
//
//  Created by etudiant on 5/21/24.
//

import SwiftUI

struct MenuPage: View {
    var body: some View {
        VStack{
            ZStack{
                Rectangle().fill(.pinkPrimary).frame(height: 80)
                Text("Menu".uppercased()).font(.title)
            }
            Spacer()
        }
    }
}

#Preview {
    MenuPage()
}
