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
                    if let croppedImage = viewModel.croppedImage {
                        Image(uiImage: croppedImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .onTapGesture {
                                viewModel.selectImage()
                            
                        }
                    } else {
                        Image(systemName: "camera.circle")
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
            ImagePicker(selectedImage: $viewModel.selectedImage, sourceType: .camera)
        }
        .alert(isPresented: $viewModel.showNoFaceAlert) {
           Alert(title: Text("No Face Detected"), message: Text("Please try again with a different photo."), dismissButton: .default(Text("OK")))
       }
        .alert(isPresented: $viewModel.showErrorAlert) {
           Alert(title: Text("An error occured"), message: Text("Please try again."), dismissButton: .default(Text("OK")))
       }
    }
}

struct ChooseOpponentComponent_Previews: PreviewProvider {
    static var previews: some View {
        ChooseOpponentComponent(viewModel: ChoosePlayerViewModel(playerName: "Player2", isBot: true))
    }
}
