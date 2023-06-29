//
//  ImagePicker.swift
//  flock
//
//  Created by Jack O'Donnell on 6/29/23.
//
import Foundation
import UIKit
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {

    @Binding var selectedImage: UIImage?
    @Binding var isPickerShowing: Bool

    func makeUIViewController(context: Context) -> some UIViewController {

        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context.coordinator

        return imagePicker

    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

}

// receiver object to get UIImagePickerController events
class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var parent: ImagePicker

    init(_ picker: ImagePicker) {
        self.parent = picker
    }

    // runs code when user selects an image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("image selected")

        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {

            // image successfully "loaded"
            
            DispatchQueue.main.async {
                self.parent.selectedImage = image
            }
        }

        // dismiss the picker
        parent.isPickerShowing = false
    }

    // runs code when user cancels the image picker UI
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("image selection cancelled")

        // dismiss the picker
        parent.isPickerShowing = false

    }



}
