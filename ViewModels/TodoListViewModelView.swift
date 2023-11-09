//
//  TodoListViewModelView.swift
//  ToDoList
//
//  Created by Brayan burgos on 6/10/23.
//
import FirebaseFirestore
import Foundation
//PrimaryTab
class TodoListViewModelView: ObservableObject{
    @Published var showingNewItemView = false
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        }
}
