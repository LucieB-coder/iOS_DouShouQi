//
//  SettingsPage.swift
//  DouShouQi
//
//  Created by etudiant on 5/28/24.
//

import SwiftUI

enum Language: String, CaseIterable, Identifiable {
    case french, english
    var id: Self { self }
}


struct SettingsPage: View {
    @State private var language: Language = .french
    
    @State private var isDarkMode: Bool = false
        
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var colorSchemeManager: ColorSchemeManager
    
    var body: some View {
        ZStack(alignment: .top){
            Rectangle().fill(Color(UIColor.systemGroupedBackground))
            VStack(alignment: .leading){
                Text("Langue").font(.title2).bold()
                List{
                    Picker("Langue", selection: $language) {
                        Text("Français").tag(Language.french)
                        Text("English").tag(Language.english)
                    }
                }.listStyle(.inset).cornerRadius(15).frame(height: 43)
                Text("Thème").font(.title2).bold().padding(.top,30)
                HStack{
                    Spacer()
                    Button(action:{
                        isDarkMode = true
                        colorSchemeManager.colorScheme = .dark
                    }){
                        Image(systemName: "moon.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .padding()
                    }
                    Spacer()
                    Button(action: {
                        isDarkMode = false
                        colorSchemeManager.colorScheme = .light
                    }){
                        Image(systemName: "sun.max.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .padding()
                    }
                    Spacer()
                }.padding()
                Spacer()
            }.padding()
        }.background(Color(UIColor.systemGroupedBackground))
            .navigationTitle("Paramètres")
    }
}

struct SettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPage()
    }
}
