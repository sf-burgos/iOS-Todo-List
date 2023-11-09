//
//  NewItemViewModelView.swift
//  ToDoList
//
//  Created by Brayan burgos on 6/10/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewModelView: ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save(){
        guard canSave else {
            return
        }
        // Get Current user id
        
        guard let userId = Auth.auth().currentUser?.uid else{
            return
        }
        
        // CreateModel
        let newId = UUID().uuidString
        let newItem = Item(id: newId,
                           tittle: title,
                           dueDate: dueDate.timeIntervalSince1970,
                           createdDate: Date().timeIntervalSince1970,
                           isDone: false)
         
        // Save Model
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
        
        
    }
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
}
