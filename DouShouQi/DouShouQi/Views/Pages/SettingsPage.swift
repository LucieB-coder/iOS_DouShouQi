//
//  SettingsPage.swift
//  DouShouQi
//
//  Created by etudiant on 5/28/24.
//

import SwiftUI

struct SettingsPage: View {
    @EnvironmentObject var colorSchemeManager: ColorSchemeManager

    var body: some View {
        ZStack(alignment: .top){
            Rectangle().fill(Color(UIColor.systemGroupedBackground))
            VStack(alignment: .leading){
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
