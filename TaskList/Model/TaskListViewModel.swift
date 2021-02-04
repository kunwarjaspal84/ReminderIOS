//
//  TaskListViewModel.swift
//  TaskList
//
//  Created by Kunwardeep Singh on 2021-02-04.
//

import Foundation
import Combine

class TaskListViewModel : ObservableObject{
    @Published var taskCellViewModels = [TaskCellViewModel]()
    
    private var Cancellables = Set<AnyCancellable>()
    
    init() {
        self.taskCellViewModels = testTaskData.map
        {
            task in TaskCellViewModel(task: task)
        }
    }
    func addItem(task: Task){
        var taskcellVM = TaskCellViewModel(task: task)
        taskCellViewModels.append(taskcellVM)
    }
}
