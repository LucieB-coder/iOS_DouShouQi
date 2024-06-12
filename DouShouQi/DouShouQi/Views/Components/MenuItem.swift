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

        VStack(alignment: .leading){
            HStack(spacing: 10){
                image.imageScale(.large)
                Text(LocalizedStringKey(label)).font(.title3).bold()
                Spacer()
            }
        }.padding(.vertical)
    }
}

struct MenuItem_Previews: PreviewProvider {
    static var previews : some View {
        MenuItem(image: Image(systemName: "house"), label: "Accueil")
    }
}
