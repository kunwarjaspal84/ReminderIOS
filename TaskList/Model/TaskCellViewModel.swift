//
//  TaskListModel.swift
//  TaskList
//
//  Created by Kunwardeep Singh on 2021-02-04.
//

import Foundation
import Combine

class TaskCellViewModel: ObservableObject, Identifiable {
    @Published var task: Task
    var id = ""
    @Published var completionStateIconName:String = ""
    private var cancellables = Set<AnyCancellable>()
    
    init(task : Task) {
        self.task = task
        
        $task
            .map{ task in
                task.completed ? "Circle.fill" : "circle"
            }
            .assign(to: \.completionStateIconName, on: self)
            .store(in: &cancellables)
        $task
        .map
        { task in
        task.id
        }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
    
}
