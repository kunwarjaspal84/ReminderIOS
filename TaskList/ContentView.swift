//
//  ContentView.swift
//  TaskList
//
//  Created by Kunwardeep Singh on 2021-01-27.
//

import SwiftUI

struct ContentView: View {
    let tsks = testTaskData
    var body: some View {
        
        NavigationView{
            VStack(alignment: .leading) {
                List(tsks) { Task in
                    Image(systemName: Task.completed ? "circle.fill" : "circle")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text(Task.title)
                        .padding(1.5)
                }
                Button(action: {}) {
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
