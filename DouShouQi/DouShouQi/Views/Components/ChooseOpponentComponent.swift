import SwiftUI

struct ChooseOpponentComponent: View {
    let options = ["BOT", "Human Player"]
    @State private var selectedOption: String = "BOT"
    @StateObject var viewModel: ChoosePlayerViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Spacer()
                Picker(selection: $selectedOption, label: Text("")) {
                    ForEach(options, id: \.self) { option in
                        Text(option).tag(option)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .onChange(of: selectedOption) { newValue in
                    viewModel.toggleIsBot()
                }
            }
            
            if selectedOption == "Human Player" {
                HStack{
                    TextField("Enter name", text: $viewModel.playerName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
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
            }
        }
        .padding()
        .sheet(isPresented: $viewModel.showImagePicker) {
            ImagePicker(selectedImage: $viewModel.selectedImage, sourceType: .photoLibrary)
        }
    }
}

struct ChooseOpponentComponent_Previews: PreviewProvider {
    static var previews: some View {
        ChooseOpponentComponent(viewModel: ChoosePlayerViewModel(playerName: "Player2", isBot: true))
    }
}
