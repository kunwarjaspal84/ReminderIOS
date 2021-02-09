//
//  taskRepository.swift
//  TaskList
//
//  Created by Kunwardeep Singh on 2021-02-08.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class TaskRespository: ObservableObject{
    
    let db = Firestore.firestore()
    
    @Published var tasks = [Task]()
    
    init() {
        loadData()
    }
    
    func loadData(){
        let userId = Auth.auth().currentUser?.uid
        
        db.collection("tasks")
            .whereField("userId", isEqualTo: userId)
            .order(by: "createdTime")
            .addSnapshotListener{(querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.tasks = querySnapshot.documents.compactMap{ document in
                    try? document.data(as: Task.self)
                }
            }
        }
    }
    
    func addTask(_ task: Task ){
        do{
            var tempTask = task
            tempTask.userId = Auth.auth().currentUser?.uid
           let _ =  try db.collection("tasks").addDocument(from: tempTask)
        }
        catch{
            fatalError("unable to encode task" + error.localizedDescription)
        }
    }
    
    func updateTask( _ task: Task)
    {
        if let TaskID = task.id {
            do{
                let _ = try db.collection("tasks").document(TaskID).setData(from: task)
            }
            catch{
                fatalError("unable to update task"+error.localizedDescription)
            }
        }
    }
}
