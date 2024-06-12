//
//  BoardViewRepresentable.swift
//  AR_Doushouqi
//
//  Created by Chloé MOURGAND on 12/06/2024.
//

import Foundation
import SwiftUI

struct BoardViewRepresentable : UIViewRepresentable {
    func makeUIView(context: Context) -> BoardArView {
        BoardArView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
     
}
