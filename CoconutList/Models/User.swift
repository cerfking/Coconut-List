//
//  User.swift
//  CoconutList
//
//  Created by Sebastian on 2023/12/31.
//

import Foundation
struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
