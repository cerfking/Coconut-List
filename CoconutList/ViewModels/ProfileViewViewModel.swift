//
//  ProfileViewViewModel.swift
//  CoconutList
//
//  Created by Sebastian on 2023/12/31.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
import FirebaseFirestoreSwift
class ProfileViewViewModel: ObservableObject {
    @Published var user: User? = nil
   
    init() {
        
    }
    
    func fetchUser() {
        print("fetching")
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
            }
        }
    }
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
    
}
