//
//  MyRemoteNotification.swift
//  ExampleNotification
//
//  Created by Sun on 02/11/2021.
//

import  UserNotifications

class MyRemoteNotification: NSObject {
    let notificationCenter = UNUserNotificationCenter.current()
    
    func setupNotificationAction() {
        let openAction = UNNotificationAction(identifier: "open", title: "Open", options: [.destructive])
        let dismissAction = UNNotificationAction(identifier: UNNotificationDismissActionIdentifier, title: "Dismiss", options: [.destructive])
        let actionCategory = UNNotificationCategory(identifier: "category", actions: [openAction, dismissAction], intentIdentifiers: [], options: .customDismissAction)
        notificationCenter.setNotificationCategories([actionCategory])
    }
    
    func registerForPushNotifications() {
        notificationCenter.delegate = self
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
            print("Permission granted: \(granted)")
        }
        setupNotificationAction()
    }
}

extension MyRemoteNotification: UNUserNotificationCenterDelegate {

    public func userNotificationCenter(_ center: UNUserNotificationCenter,
                                       willPresent notification: UNNotification,
                                       withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let request = notification.request
        let content = request.content
        let title = content.title
        let body = content.body
        
        let userInfo = content.userInfo

        print("----- RemoteNotification debug willPresent ------ title = ", title)
        print("----- RemoteNotification debug willPresent ------ body = ", body)
        
        completionHandler([.banner, .list, .sound])
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let notification = response.notification
        let request = notification.request
        let content = request.content
        let title = content.title
        let body = content.body
        print("----- RemoteNotification debug didReceive ------ title = ", title)
        print("----- RemoteNotification debug didReceive ------ body = ", body)

        
        if response.actionIdentifier == "open" {
            // show this notification five seconds from now
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            // choose a random identifier
            let request2 = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            // add our notification request
            UNUserNotificationCenter.current().add(request2)
            
        }else{ // Vegetable
            
        }

        
        
        completionHandler()
    }
}
