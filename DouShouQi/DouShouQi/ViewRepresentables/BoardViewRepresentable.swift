//
//  BoardViewRepresentable.swift
//  AR_Doushouqi
//
//  Created by Chloé MOURGAND on 12/06/2024.
//

import Foundation
import SwiftUI
import RealityKit
import DouShouQiModel

struct BoardViewRepresentable : UIViewRepresentable {
    
    @ObservedObject var arGameViewModel: ARGameViewModel

    init(arGameViewModel: ARGameViewModel){
        self.arGameViewModel = arGameViewModel
    }
    
    func makeUIView(context: Context) -> BoardARView {
        arGameViewModel.boardArView.displayBoard(arGameViewModel.game!.board)
        Task{
            try! await arGameViewModel.game!.start()
        }
        return arGameViewModel.boardArView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
     
}
