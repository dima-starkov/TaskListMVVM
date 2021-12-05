//
//  RealmManager.swift
//  TaskListMVVM
//
//  Created by Дмитрий Старков on 05.12.2021.
//

import Foundation

import RealmSwift

let realm = try! Realm()

class RealmManager {

 static func saveTask(task: Task) {
        try! realm.write({
            realm.add(task)
        })
    }
   static func deleteTask(task:Task) {
       try! realm.write({
           realm.delete(task)
       })
    }
    
    static func changeTask(task: Task,isDeleted: Bool, isCompleted: Bool) {
        try! realm.write({
            task.isDeleted = isDeleted
        })
    }
    
}
