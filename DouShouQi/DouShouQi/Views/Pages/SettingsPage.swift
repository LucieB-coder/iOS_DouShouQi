//
//  SettingsPage.swift
//  DouShouQi
//
//  Created by etudiant on 5/28/24.
//

import SwiftUI

struct SettingsPage: View {
    @EnvironmentObject var colorSchemeManager: ColorSchemeManager
    @EnvironmentObject var languageManager: LanguageManager

    var body: some View {
        ZStack(alignment: .top){
            Rectangle().fill(Color(UIColor.systemGroupedBackground))
            VStack(alignment: .leading){
                Text("Language").font(.title2).bold()
                Picker("Select Language", selection: $languageManager.selectedLanguage) {
                    Text("English").tag("en")
                    Text("French").tag("fr")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                Text("Theme").font(.title2).bold().padding(.top,30)
                HStack{
                    Spacer()
                    Button(action: {
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
            .navigationTitle("Settings")
    }
}
