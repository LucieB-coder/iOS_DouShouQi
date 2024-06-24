//
//  ContentView.swift
//  AR_Doushouqi
//
//  Created by Chloé MOURGAND on 12/06/2024.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        BoardViewRepresentable().ignoresSafeArea()
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
