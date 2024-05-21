//
//  MenuItem.swift
//  DouShouQi
//
//  Created by etudiant on 5/21/24.
//

import SwiftUI

struct MenuItem: View {
    var image: Image;
    var label : String;
    var body: some View {
        NavigationStack {
            NavigationLink(destination: TabViewLayout()) {
                HStack {
                    image
                    Text(label)
                }
                .padding()
                .cornerRadius(10) // Adjust the radius value as needed
            }
            .foregroundColor(.black)
        }
        .frame(height: 70)
    }
}

#Preview {
    MenuItem(image: Image(systemName: "house"), label: "Accueil")
}
