//
//  TaskListViewModel.swift
//  TaskList
//
//  Created by Kunwardeep Singh on 2021-02-04.
//

import Foundation
import Combine

class TaskListViewModel : ObservableObject{
    @Published var taskRepository = TaskRespository()
    
    @Published var taskCellViewModels = [TaskCellViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        taskRepository.$tasks
            .map{ tasks in
                tasks.map {
                    task in
                    TaskCellViewModel(task: task)
                }
            }
            .assign(to: \.taskCellViewModels, on: self)
            .store(in: &cancellables)
        
    }
    func addItem(task: Task){
        taskRepository.addTask(task)
    }
}
