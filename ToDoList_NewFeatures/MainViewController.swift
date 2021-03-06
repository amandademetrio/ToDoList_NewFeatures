////
////  MainViewController.swift
////  ToDoList_NewFeatures
////
////  Created by Amanda Demetrio on 9/19/18.
////  Copyright © 2018 Amanda Demetrio. All rights reserved.
////
//
//import UIKit
//import CoreData
//
//class MainViewController: UIViewController {
//
//    let sections: [String] = ["To-Do","Completed"]
//
//    var tableData: [String:[Task]] = [
//        "To-Do":[],
//        "Completed":[]
//    ]
//
//    //Stagging area for stuff to be added to Core Data
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//    let saveContext = (UIApplication.shared.delegate as! AppDelegate).saveContext
//
//    @IBOutlet weak var tableView: UITableView!
//
//    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
//        performSegue(withIdentifier: "AddTaskSegue", sender: nil)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.dataSource = self
//        tableView.delegate = self
//
//        fetchAllItems()
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let addTaskController = segue.destination as! AddTaskViewController
//        addTaskController.delegate = self as AddTaskViewDelegate
//    }
//
//    func fetchAllItems() {
//        var tasksInList: [Task] = []
//        let taskRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
//        do {
//            let results = try context.fetch(taskRequest)
//            tasksInList = results as! [Task]
//            for task in tasksInList {
//                if task.isCompleted == true {
//                    tableData["Completed"]?.append(task)
//                }
//                else {
//                    tableData["To-Do"]?.append(task)
//                }
//            }
//            }
//        catch {
//            print("Errors are \(error)")
//        }
//    }
//}
//
//extension MainViewController: AddTaskViewDelegate {
//    func sendDataToMainView(_ taskName: String, _ taskDesc: String, _ dueDate: Date) {
//        let newTask = Task(context: context)
//        newTask.title = taskName
//        newTask.desc = taskDesc
//        newTask.dueDate = dueDate
//        newTask.isCompleted = false
//        tableData["To-Do"]?.append(newTask)
//        tableView.reloadData()
//        saveContext()
//        print("table data is",tableData)
//        dismiss(animated: true, completion: nil)
//    }
//}
//
//extension MainViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return sections.count
//    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return sections[section]
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let key = sections[section]
//        return tableData[key]!.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! CustomTaskCell
//        let key = sections[indexPath.section]
//        cell.titleLabel?.text = "Title"
//
//        //"\(String(describing: tableData[key]?[indexPath.row].title))"
//        cell.descLabel?.text = "description"
//
//        //"\(String(describing: tableData[key]?[indexPath.row].desc))"
//        cell.dueDateLabel?.text = "11/11/11"
//
//        //"\(String(describing: tableData[key]?[indexPath.row].dueDate))"
//        return cell
//    }
//
//}
//
