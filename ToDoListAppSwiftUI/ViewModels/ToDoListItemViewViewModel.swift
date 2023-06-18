//
//  ToDoListItemViewViewModel.swift
//  ToDoListAppSwiftUI
//
//  Created by Tazo Gigitashvili on 13.06.23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

/// viewModel for single to do list item(each row)
class ToDoListItemViewViewModel: ObservableObject {
    
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
