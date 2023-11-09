//
//  Item.swift
//  ToDoList
//
//  Created by Brayan burgos on 6/10/23.
//

import Foundation

struct Item: Codable, Identifiable{
    
    let id: String
    let tittle: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
}
