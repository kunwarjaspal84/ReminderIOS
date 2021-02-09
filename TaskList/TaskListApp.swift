//
//  TaskListApp.swift
//  TaskList
//
//  Created by Kunwardeep Singh on 2021-01-27.
//

import SwiftUI
import Firebase

@main
struct TaskListApp: App {
    init() {
        FirebaseApp.configure()
        Auth.auth().signInAnonymously()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
