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
        
        let hour: Int
        let minute: Int
        
        if periodo == "manha" {
            hour = 09
            minute = 00
        } else if periodo == "tarde" {
            hour = 14
            minute = 00
        } else {
            hour = 19
            minute = 00
        }
        
        let notificationCenter = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        let identifier = "identifier"
        
        content.title = titulo
        content.body = "Já está na hora de \(titulo), vamos?"
        content.sound = .default
        
        // The selected time to notify the user
        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        // The time/repeat trigger
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // Initializing the Notification Request object to add to the Notification Center
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        // Adding the notification to the center
        notificationCenter.add(request) { (error) in
            if (error) != nil {
                print(error!.localizedDescription)
            }
        }
}
        

    
    func  agendarCompromisso (compromisso: Compromisso) {
        let titulo = compromisso.titulo
        let periodo = compromisso.periodo
        
        print(compromisso.periodo)
        
        let notificationCenter = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        let identifier = "identifier"
        
        content.title = titulo
        content.body = "Já está na hora de \(titulo), vamos?"
        content.sound = .default
        
        // The selected time to notify the user
        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current
//        dateComponents = compromisso.periodo
        
        // The time/repeat trigger
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // Initializing the Notification Request object to add to the Notification Center
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        // Adding the notification to the center
        notificationCenter.add(request) { (error) in
            if (error) != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
}
