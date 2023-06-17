//
//  ToDoListViewViewModel.swift
//  ToDoListAppSwiftUI
//
//  Created by Tazo Gigitashvili on 13.06.23.
//

import FirebaseFirestore
import Foundation

///viewModel for list of items view, primary view
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    /// - Parameter id: Item id to delete
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
