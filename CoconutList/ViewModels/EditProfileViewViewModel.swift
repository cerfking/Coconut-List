//
//  EditProfileViewViewModel.swift
//  CoconutList
//
//  Created by Sebastian on 2024/1/1.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
import FirebaseStorage
import SwiftUI
class EditProfileViewViewModel: ObservableObject {
    @Published var user: User? = nil
    @Published var name = ""
    @Published var selectedImage: UIImage?
    @Published var isUpdating = false

    init() {
        
    }
    
    func uploadAvatar(completion: @escaping(Bool) -> Void) {
        let storage = Storage.storage().reference()
        guard let user = user else {
            return
        }
        guard let avatarData = selectedImage?.pngData() else {
            print("isnil")
            return
        }
        storage.child("avatars/\(user.id)Avatar.png").putData(avatarData) {
            _, error in
            guard error == nil else {
                return
            }
            storage.child("avatars/\(user.id)Avatar.png").downloadURL { url, error in
                guard let url = url, error == nil else {
                    return
                }
                let db = Firestore.firestore()
                
                let userRef = db.collection("users").document(user.id)
                   
               
                userRef.updateData(["avatar": url.absoluteString])
                print("Document successfully updated")
                completion(true)
                
            }
        }
       
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        return true
    }
    
    
    func updateProfile(completion: @escaping (Bool) -> Void) {
        isUpdating = true
   
        self.uploadAvatar() {[self]  success in
            if(success) {
                guard validate() else {
                    isUpdating = false
                    return
                }
                guard let user = user else {
                    isUpdating = false
                    return
                }
                let db = Firestore.firestore()
                
                let userRef = db.collection("users").document(user.id)
                   
               
                userRef.updateData(["name": name])
                completion(true)
                isUpdating = false
            }
        }
        
    }
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument {[weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.user = User(id: data["id"] as? String ?? "", name: data["name"] as? String ?? "", email:  data["email"] as? String ?? "", joined:  data["joined"] as? TimeInterval ?? 0, avatar: data["avatar"] as? String ?? "https://cdn-icons-png.flaticon.com/512/5556/5556499.png")
                self?.name = data["name"] as? String ?? ""
                

            }
            if (self?.selectedImage == nil) {
                if let avatarURLString = data["avatar"] as? String,
                   let avatarURL = URL(string: avatarURLString) {

                    let task = URLSession.shared.dataTask(with: avatarURL) { (data, response, error) in
                        // Check for errors and handle them
                        if let error = error {
                            print("Error loading image data: \(error)")
                            return
                        }

                        // Check if data is received successfully
                        guard let imageData = data else {
                            print("No data received for the avatar URL.")
                            return
                        }

                        // Update the UI on the main thread
                        DispatchQueue.main.async {
                            self?.selectedImage = UIImage(data: imageData)
                        }
                    }

                    // Start the URLSession data task
                    task.resume()
                } else {
                    // Handle the case where the "avatar" key is not a valid string or URL
                    print("Invalid avatar URL string")
                }
            }
            
        }
    }
}
