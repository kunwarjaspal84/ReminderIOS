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
    
    @Published var taskrepository = TaskRespository()
    var id = ""
    @Published var completionStateIconName:String = ""
    private var cancellables = Set<AnyCancellable>()
    
    init(task : Task) {
        self.task = task
        
        $task
            .map{ task in
                task.completed ? "checkmark.circle.fill" : "circle"
            }
            .assign(to: \.completionStateIconName, on: self)
            .store(in: &cancellables)
        $task
        .compactMap
        { task in
        task.id
        }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
        
        $task
            .dropFirst()
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .sink { (task) in
                self.taskrepository.updateTask(task)
            }
            .store(in: &cancellables)
    }
    
}
