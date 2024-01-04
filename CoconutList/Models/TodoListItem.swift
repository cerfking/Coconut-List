//
//  TodoListItem.swift
//  CoconutList
//
//  Created by Sebastian on 2023/12/31.
//

import Foundation

struct TodoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
