//
//  Model.swift
//  TaskList
//
//  Created by Kunwardeep Singh on 2021-01-27.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Task: Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var completed: Bool
    @ServerTimestamp var createdTime : Timestamp?
    var userId: String?
}

let testTaskData = [
    
    Task(title: "do something", completed: true),
    Task(title: "did something", completed: false)
]
