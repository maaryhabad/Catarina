//
//  appDelegate + Extensions.swift
//  Catarina
//
//  Created by Mariana Beilune Abad on 08/09/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import Foundation
import UserNotifications

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.alert, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        
        if response.notification.request.identifier == "Local Notification" {
            print("Handling notifications with the Local Notification Identifier")
        }
        
        completionHandler()
    }
    
    func agendarTarefa (tarefa: Tarefa) {
        let titulo = tarefa.titulo
        let periodo = tarefa.periodo
        
        let content = UNMutableNotificationContent()
        let categoryIndetifire = "Delete Notification Type"
        
        content.title  = titulo
        content.body = "Oi! Já está na hora de \(titulo), vamos começar?"
        content.sound = UNNotificationSound.default
        content.badge = 1
        content.categoryIdentifier = categoryIndetifire
        
        let triggerDaily = Calendar.current.dateComponents([.hour,.minute,.second,], from: periodo)//tem que ser um atributo date
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: false)
        let identifier = "\(titulo)"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter.add(request) { (error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
        
        let snoozeAction = UNNotificationAction(identifier: "Snooze", title: "Snooze", options: [])
        let deleteAction = UNNotificationAction(identifier: "DeleteAction", title: "Delete", options: [.destructive])
        let category = UNNotificationCategory(identifier: categoryIdentifire,
                                              actions: [snoozeAction, deleteAction],
                                              intentIdentifiers: [],
                                              options: [])
        notificationCenter.setNotificationCategories([category])
        
    }
    
   
    
    func  agendarCompromisso (compromisso: Compromisso) {
        let titulo = compromisso.titulo
        let periodo = compromisso.periodo
        
        let content = UNMutableNotificationContent()
        let categoryIndetifire = "Delete Notification Type"
        
        content.title  = titulo
        content.body = "Oi! Já está na hora do compromisso: \(titulo), vamos?"
        content.sound = UNNotificationSound.default
        content.badge = 1
        content.categoryIdentifier = categoryIndetifire

    }
    
    func scheduleNotification(remedio: HomeRemedio, notificationDate: Date, iteration: Int) {
        
        
        let triggerDaily = Calendar.current.dateComponents([.hour,.minute,.second,], from: notificationDate)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: false)
        let identifier = "\(remedio.nome) \(iteration)"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter.add(request) { (error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
        
        let snoozeAction = UNNotificationAction(identifier: "Snooze", title: "Snooze", options: [])
        let deleteAction = UNNotificationAction(identifier: "DeleteAction", title: "Delete", options: [.destructive])
        let category = UNNotificationCategory(identifier: categoryIdentifire,
                                              actions: [snoozeAction, deleteAction],
                                              intentIdentifiers: [],
                                              options: [])
        notificationCenter.setNotificationCategories([category])
        //        print(categoryIdentifire + String(iteration))
    }
}
