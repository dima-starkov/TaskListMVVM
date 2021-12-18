//
//  TaskListViewController.swift
//  ArchitectureHomework
//
//  Created by Дмитрий Старков on 24.11.2021.
//

import UIKit
import RealmSwift

class DeletedTaskViewController: UIViewController {
    
   private var taskArray: Results<Task>!
    
   private let taskTable: UITableView = {
        let table = UITableView()
        table.register(TaskListTableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(taskTable)
        taskArray = realm.objects(Task.self).filter("isDeleted == true")
        taskTable.delegate = self
        taskTable.dataSource = self
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        taskTable.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        taskTable.reloadData()
    }
}

extension DeletedTaskViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! TaskListTableViewCell
        let model = taskArray[indexPath.row]
        cell.configure(with: TaskTableVIewCellViewModel(name: model.name, description: model.descriptions, deadline: model.deadline,isCompleted: model.isCompleted))
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = taskArray[indexPath.row]
            RealmManager.deleteTask(task: task)
            taskTable.reloadData()
        }
    }
}

