//
//  TodoListItemsViewViewModel.swift
//  CoconutList
//
//  Created by Sebastian on 2023/12/31.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class TodoListItemsViewViewModel: ObservableObject {
    init() {
        
    }
    
    func toggleIsDone(item: TodoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
