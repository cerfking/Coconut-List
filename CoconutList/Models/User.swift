//
//  User.swift
//  CoconutList
//
//  Created by Sebastian on 2023/12/31.
//

import Foundation
struct User: Codable, Identifiable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
    var avatar: String = "https://cdn-icons-png.flaticon.com/512/5556/5556499.png"
}
