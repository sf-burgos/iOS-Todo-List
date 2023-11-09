//
//  User.swift
//  ToDoList
//
//  Created by Brayan burgos on 6/10/23.
//

import Foundation

struct User : Codable{
    let id: String
    let name:String
    let email: String
    let joined: TimeInterval
}
