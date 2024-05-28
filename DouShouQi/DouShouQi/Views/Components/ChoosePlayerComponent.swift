//
//  ChosePlayerComponent.swift
//  DouShouQi
//
//  Created by Thomas Chazot on 27/05/2024.
//

import SwiftUI

struct ChoosePlayerComponent: View {
    @StateObject var viewModel: ChoosePlayerViewModel

    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .center){
                TextField("Enter name", text: $viewModel.playerName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Spacer()
                if let selectedImage = viewModel.selectedImage {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .onTapGesture {
                            viewModel.selectImage()
                        }
                } else {
                    Image(systemName: "photo.artframe.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .onTapGesture {
                            viewModel.selectImage()
                        }
                }
            }
            .padding()
            .sheet(isPresented: $viewModel.showImagePicker) {
                ImagePicker(selectedImage: $viewModel.selectedImage, sourceType: .photoLibrary)
            }
        }
    }
}

#Preview {
    ChoosePlayerComponent(viewModel: ChoosePlayerViewModel(playerName: "Player1"))
}

struct ChoosePlayerComponent_Previews: PreviewProvider {
    static var previews: some View {
        ChoosePlayerComponent(viewModel: ChoosePlayerViewModel(playerName: "Player1"))

    }
}
