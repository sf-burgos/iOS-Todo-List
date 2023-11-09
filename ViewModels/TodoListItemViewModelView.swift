//
//  TodoListItemViewModelView.swift
//  ToDoList
//
//  Created by Brayan burgos on 6/10/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation
//Each Row
class TodoListItemViewModelView: ObservableObject{
    init(){}
    
    func toggleIsDone(item: Item){
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
            .setData(itemCopy.asDictionary() )
    }
}
