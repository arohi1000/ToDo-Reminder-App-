//
//  Notificationutil.swift
//  ToDo Reminder App
//
//  Created by Arohi, Agnivesh (Contractor) on 12/05/23.
//

import Foundation
import UIKit
import UserNotifications
extension UIViewController{
    
    
    func scheduleLocalNotification(title: String, body: String, date: Date){
        
        //create notification content
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        
        //create trigger
        let triggerDateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDateComponents, repeats: false)
        
        //create request
        
        let request = UNNotificationRequest(identifier: "ToDo", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request){ (error) in
            if let error = error{
                print("Error scheduling notification: \(error.localizedDescription)")
            }else{
                print("Notifications scheduled successfully.")
            }
        }
    }
}
