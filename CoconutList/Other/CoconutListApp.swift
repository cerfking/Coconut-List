//
//  CoconutListApp.swift
//  CoconutList
//
//  Created by Sebastian on 2023/12/31.
//
import FirebaseCore
import SwiftUI

@main
struct CoconutListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
