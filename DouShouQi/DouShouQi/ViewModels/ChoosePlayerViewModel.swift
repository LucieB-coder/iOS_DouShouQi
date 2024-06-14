import SwiftUI
import Combine
import UIKit

class ChoosePlayerViewModel : ObservableObject {
    @Published var showImagePicker: Bool = false
    @Published var selectedImage: UIImage? = nil
    @Published var playerName: String
    @Published var isBot: Bool
    
    init(playerName: String, isBot: Bool = false){
        self.playerName = playerName
        self.isBot = isBot
    }
    
    func toggleIsBot(){
        self.isBot = !self.isBot
    }

    
    func selectImage() {
        showImagePicker = true
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    var sourceType: UIImagePickerController.SourceType

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            picker.dismiss(animated: true)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
}
