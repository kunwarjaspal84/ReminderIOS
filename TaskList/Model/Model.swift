//
//  Model.swift
//  TaskList
//
//  Created by Kunwardeep Singh on 2021-01-27.
//

import Foundation

struct Task: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var completed: Bool
}

let testTaskData = [
    
    Task(title: "do something", completed: true),
    Task(title: "did something", completed: false)
]
