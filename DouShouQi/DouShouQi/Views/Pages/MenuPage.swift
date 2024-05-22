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
    
    static func == (lhs: MenuItemData, rhs: MenuItemData) -> Bool {
            return lhs.id == rhs.id
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
}

struct MenuPage: View {
    var items: [MenuItemData] = [
        MenuItemData(image: Image(systemName: "gearshape.fill"), label: "Paramètres"),
        MenuItemData(image: Image(systemName: "person.fill"), label: "Profil"),
    ]
    var body: some View {
        NavigationStack {
            List(items, id: \.self) { item in
                NavigationLink(value: item) {
                    MenuItem(image: item.image, label: item.label)
                }
            }
            .navigationTitle("Menu")
            .navigationDestination(for: String.self) { item in
                TabViewLayout()
            }
        }
    }
}

struct MenuPage_Previews: PreviewProvider {
    static var previews : some View {
        MenuPage()
    }
}

