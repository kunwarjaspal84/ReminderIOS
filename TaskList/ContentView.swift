//
//  ContentView.swift
//  TaskList
//
//  Created by Kunwardeep Singh on 2021-01-27.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var taskListVM = TaskListViewModel()
    @State var presentAddItem = false
    var body: some View {
        
        NavigationView{
            VStack(alignment: .leading) {
                List{
                ForEach(taskListVM.taskCellViewModels) { Task in
                    TaskCell(taskCellVM: Task)
                }
                    if presentAddItem {
                        TaskCell(taskCellVM: TaskCellViewModel(task: Task(title: "", completed: false))){
                            task in taskListVM.addItem(task: task)
                            self.presentAddItem.toggle()
                        }
                    }
                }
                Button(action: {self.presentAddItem.toggle()}) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Add New Task")
                    
                }.padding(10)
            }.navigationTitle("TASKS")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TaskCell: View {
    @ObservedObject var taskCellVM:TaskCellViewModel
    
    var onCommit:(Task) -> (Void) = {_ in }
    var body: some View {
        HStack{
        Image(systemName: taskCellVM.task.completed ? "circle.fill" : "circle")
            .resizable()
            .frame(width: 20, height: 20)
            .onTapGesture {
                self.taskCellVM.task.completed.toggle()
            }
            TextField("Enter the task", text: $taskCellVM.task.title, onCommit: {self.onCommit(self.taskCellVM.task)})
            .padding(1.5)
    }
    }
}
