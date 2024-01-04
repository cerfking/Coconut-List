//
//  ImagePicker.swift
//  CoconutList
//
//  Created by Sebastian on 2024/1/2.
//

import Foundation
import UIKit
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Binding var isPickerShowing: Bool
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController();
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context.coordinator
        imagePicker.allowsEditing = true
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    
}

class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var parent: ImagePicker
    
    init(parent: ImagePicker) {
        self.parent = parent
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("image selected")
        if let image =  info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            DispatchQueue.main.async {
                self.parent.selectedImage = image
            }
        }
        parent.isPickerShowing = false
    
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("cancelled")
        parent.isPickerShowing = false
    }
}
