//
//  SwiftUIView.swift
//  DouShouQi
//
//  Created by etudiant on 5/21/24.
//

import SwiftUI


struct MenuItemData: Identifiable, Hashable {
    var id = UUID()
    var image: Image
    var label: String
    var linkTo: AnyView
    
    static func == (lhs: MenuItemData, rhs: MenuItemData) -> Bool {
            return lhs.id == rhs.id
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
}

struct MenuPage: View {
    var items: [MenuItemData] = [
        MenuItemData(image: Image(systemName: "gearshape.fill"), label: "Paramètres", linkTo: AnyView(SettingsPage())),
        MenuItemData(image: Image(systemName: "person.fill"), label: "Profil", linkTo: AnyView(PlayerPage())),
    ]
    var body: some View {
        NavigationStack {
            List(items, id: \.self) { item in
                NavigationLink {
                    item.linkTo
                } label: {
                    MenuItem(image: item.image, label: item.label)
                }
            }
            .navigationTitle("Menu")
        }
    }
}

struct MenuPage_Previews: PreviewProvider {
    static var previews : some View {
        MenuPage()
    }
}

