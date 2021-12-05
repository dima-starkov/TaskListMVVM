//
//  TaskTableViewCellViewModel.swift
//  TaskListMVVM
//
//  Created by Дмитрий Старков on 05.12.2021.
//

import Foundation

struct TaskTableVIewCellViewModel {
    var name: String
    var description: String
    var deadline: Date
    var isCompleted: Bool
    
    public func formattedDate(date: Date) -> String {
        let df = DateFormatter()
        df.dateFormat = "dd.MM"
       let str = df.string(from: date)
        return str
    }
}
