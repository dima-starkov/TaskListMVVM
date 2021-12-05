//
//  ViewController.swift
//  TaskListMVVM
//
//  Created by Дмитрий Старков on 05.12.2021.
//

import UIKit

class NewTaskViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var deadlineDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addTaskButton(_ sender: UIButton) {
        guard let text = nameTextField.text,
              let description =  descriptionTextField.text else {
                  return
              }
        if text == "" || description == "" {
            showAlert()
        } else {
            let task = Task(name: text, description: description, createdDate: Date(), deadline: deadlineDatePicker.date, isComleted: false, isDeleted: false)
            RealmManager.saveTask(task: task)
            print(task)
        }
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Ошибка!", message: "Заполните имя или описание", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Хорошо", style: .cancel, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
    
}

