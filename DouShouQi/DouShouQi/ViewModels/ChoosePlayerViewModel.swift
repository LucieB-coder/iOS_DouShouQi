import SwiftUI
import Vision
import Combine
import UIKit

@MainActor
class ChoosePlayerViewModel : ObservableObject {
    @Published var showImagePicker: Bool = false
    @Published var croppedImage: UIImage? = nil
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
    @Published var showErrorAlert: Bool = false
    
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
        guard let cgImage = image.cgImage else {
            self.showErrorAlert = true
            self.croppedImage = image
            return
        }

        // Correct the orientation of the image before passing it to Vision
        let orientedImage = UIImage(cgImage: cgImage, scale: image.scale, orientation: .up)

        let request = VNDetectFaceRectanglesRequest { (request, error) in
            if error != nil {
                self.showErrorAlert = true
                self.croppedImage = image
                return
            }
            
            guard request.results != nil else{
                self.showErrorAlert = true
                self.croppedImage = image
                return
            }

            
            guard let results = request.results as? [VNFaceObservation], !results.isEmpty else {
                DispatchQueue.main.async {
                    self.showNoFaceAlert = true
                    self.showImagePicker = false
                    self.croppedImage = image
                }
                return
            }

            if let firstFace = results.first {
                self.cropImage(to: firstFace.boundingBox, in: orientedImage)
            }
        }

        let handler = VNImageRequestHandler(cgImage: orientedImage.cgImage!, options: [:])
        do {
            try handler.perform([request])
        } catch {
            self.showErrorAlert = true
        }
    }

    private func cropImage(to boundingBox: CGRect, in image: UIImage) {
        // Calculate the cropping rectangle in the CGImage coordinate space (origin at bottom left corner)
        let width = boundingBox.width * CGFloat(image.size.width)
        let height = boundingBox.height * CGFloat(image.size.height)
        let x = boundingBox.origin.x * CGFloat(image.size.width)
        let y = (1 - boundingBox.origin.y - boundingBox.height) * CGFloat(image.size.height)

        let cropRect = CGRect(x: x, y: y, width: width, height: height).integral

        guard let sourceCGImage = image.cgImage else {
            self.showErrorAlert = true
            return
        }

        guard let croppedCGImage = sourceCGImage.cropping(to: cropRect) else {
            self.showErrorAlert = true
            return
        }

        // Create a UIImage from the cropped CGImage
        let croppedImage = UIImage(
            cgImage: croppedCGImage,
            scale: image.scale,
            orientation: .right // Ensure the cropped image is oriented correctly
        )

        DispatchQueue.main.async {
            self.croppedImage = croppedImage
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
