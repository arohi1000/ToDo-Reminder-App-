//
//  ToDoTask.swift
//  ToDo Reminder App
//
//  Created by Arohi, Agnivesh (Contractor) on 11/05/23.
//

import Foundation
import UIKit

struct ToDoTask{
    
    static var instance = ToDoTask()
    
    let dbContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private init(){
        
    }
    
    
    //Add Task
    func addTask(title:String, body:String, priority:String, date:Date){
   let ToDo = ToDoList(context: dbContext)
        ToDo.title=title
        ToDo.body=body
        ToDo.priority=priority
        ToDo.date=date
        do{
            //saving
            try dbContext.save()
        }catch{
            
        }
        
    }
    //get all data from ToDo
    func getAllData() ->[ToDoList]{
        let toDoList = ToDoList.fetchRequest()
        do{
            let result = try dbContext.fetch(toDoList)
           
            return result
        }catch{
            return []
        }
        
       
    }

    //Delete the task Functon
    func deleteTask(todo: ToDoList){
        dbContext.delete(todo)
        do{
            try dbContext.save()
        }catch{
            
        }
    }
    
    
    
    
    
    
}
