//
//  User.swift
//  ToDoListAppSwiftUI
//
//  Created by Tazo Gigitashvili on 13.06.23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
