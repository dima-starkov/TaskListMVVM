//
//  TaskModel.swift
//  TaskListMVVM
//
//  Created by Дмитрий Старков on 05.12.2021.
//

import Foundation
import RealmSwift

class Task: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var descriptions = ""
    @objc dynamic var createdDate = Date()
    @objc dynamic var deadline = Date()
    @objc dynamic var isCompleted = false
    @objc dynamic var isDeleted = false
    
    convenience init(name: String,description: String,createdDate: Date,deadline: Date,isComleted: Bool,isDeleted: Bool) {
        self.init()
        self.name = name
        self.descriptions = description
        self.createdDate = createdDate
        self.deadline = deadline
        self.isCompleted = isCompleted
        self.isDeleted = isDeleted
    }
}

