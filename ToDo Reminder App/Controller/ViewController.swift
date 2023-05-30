//
//  ViewController.swift
//  ToDo Reminder App
//
//  Created by Agnivesh Arohi on 10/05/23.
//
import UserNotifications
import UIKit




class ViewController: UIViewController {
        @IBOutlet var table: UITableView!
    
    var isAuthorized = false
    var todoList : [ToDoList] = []
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        checkNotificationPermission()
        UNUserNotificationCenter.current().delegate = self
        
       
        // Do any additional setup after loading the view.
        table.delegate=self
        table.dataSource=self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        todoList = ToDoTask.instance.getAllData()
        table.reloadData()
    }
    
    //Notification
    func checkNotificationPermission(){
        UNUserNotificationCenter.current().getNotificationSettings{ settings in
            switch settings.authorizationStatus{
            case.notDetermined:
                UNUserNotificationCenter.current().requestAuthorization(options:[.alert, .badge, .sound]){ success, _ in
                    if success{
                        self.isAuthorized = true
                    }
                    else{
                        self.isAuthorized = false
                    }
                }
            case.denied:
                self.isAuthorized = true
            case.authorized:
                self.isAuthorized = false
            default:
                break
           }
        }
    }
    
    
}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction =   UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            let toDoTaskDel = self.todoList[indexPath.row]
            ToDoTask.instance.deleteTask(todo: toDoTaskDel)
            self.todoList.remove(at: indexPath.row)
            self.table.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
        
    
}
extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TaskTableViewCell
        
        let task = todoList[indexPath.row]
        cell.titleL.text = task.title
        cell.bodyL.text = task.body
        
        
        
        
        
        cell.dateL.text = task.date?.formatted()
        cell.priorityL.text = task.priority
        
        
        return cell
    }
    
    
}

extension ViewController: UNUserNotificationCenterDelegate{
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
    }
}



