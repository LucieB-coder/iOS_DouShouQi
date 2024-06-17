//
//  SettingsPage.swift
//  DouShouQi
//
//  Created by etudiant on 5/28/24.
//

import SwiftUI

struct SettingsPage: View {
    @EnvironmentObject var colorSchemeManager: ColorSchemeManager
    @ObservedObject var musicHelper = MusicHelper.getMusicHelper()
    
    var body: some View {
        ZStack(alignment: .top){
            Rectangle().fill(Color(UIColor.systemGroupedBackground))
            VStack(alignment: .leading){
                Text("Theme").font(.title2).bold().padding(.top,30)
                HStack{
                    Spacer()
                    Button(action: {
                        colorSchemeManager.colorScheme = .dark
                        musicHelper.playSound(filePath: "nuit")
                        
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
                        musicHelper.playSound(filePath: "jour")
                        
                    }){
                        Image(systemName: "sun.max.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .padding()
                    }
                    Spacer()
                }.padding()
                Text("Music").font(.title2).bold().padding(.top,30)
                
                Toggle(isOn: $musicHelper.backgroundMusic) {
                    Text("Background Music")
                }
                Toggle(isOn: $musicHelper.soundEffects) {
                    Text("Sound Effects")
                }
                
                Spacer()
            }.padding()
        }.background(Color(UIColor.systemGroupedBackground))
            .navigationTitle("Settings")
    }
}

struct SettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPage()
    }
}
