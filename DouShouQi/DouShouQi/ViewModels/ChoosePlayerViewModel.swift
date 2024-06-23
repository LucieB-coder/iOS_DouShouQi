import SwiftUI
import Vision
import Combine
import UIKit

class ChoosePlayerViewModel : ObservableObject {
    @Published var showImagePicker: Bool = false
    @Published var selectedImage: UIImage? = nil {
        didSet {
            if let image = selectedImage {
                detectFace(in: image)
            }
        }
    }
    @Published var playerName: String
    @Published var isBot: Bool
    @Published var showNoFaceAlert: Bool = false
    
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
    
    private func detectFace(in image: UIImage) {
        guard let cgImage = image.cgImage else { return }

        let request = VNDetectFaceRectanglesRequest { (request, error) in
            if let error = error {
                self.showNoFaceAlert = true
                return
            }

            guard let results = request.results as? [VNFaceObservation], !results.isEmpty else {
                self.showNoFaceAlert = true
                return
            }

            if let firstFace = results.first {
                self.cropImage(to: firstFace.boundingBox, in: image)
            }
        }

        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        do {
            try handler.perform([request])
        } catch {
            print("Failed to perform request: \(error)")
            self.showNoFaceAlert = true
        }
    }
    
    private func cropImage(to boundingBox: CGRect, in image: UIImage) {
        let width = boundingBox.width * CGFloat(image.size.width)
        let height = boundingBox.height * CGFloat(image.size.height)
        let x = boundingBox.origin.x * CGFloat(image.size.width)
        let y = (1 - boundingBox.origin.y - boundingBox.height) * CGFloat(image.size.height)

        let croppingRect = CGRect(x: x, y: y, width: width, height: height).integral

        guard let cgImage = image.cgImage?.cropping(to: croppingRect) else {
            self.showNoFaceAlert = true
            return
        }

        let croppedImage = UIImage(cgImage: cgImage)
        DispatchQueue.main.async {
            self.selectedImage = croppedImage
        }
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
