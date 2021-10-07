//
//  MyRemoteNotification.swift
//  ExampleNotification
//
//  Created by Sun on 02/11/2021.
//

import  UserNotifications

class MyRemoteNotification: NSObject {
    let notificationCenter = UNUserNotificationCenter.current()
    
    func registerForPushNotifications() {
        notificationCenter.delegate = self
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
            print("Permission granted: \(granted)")
        }
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
        if let jsonData = userInfo["navigator"] as? [String : String] {
            let navigator = Navigator(jsonData: jsonData)
            print("------- debug ------- screenName = ", navigator.screenName)
            print("------- debug ------- type = ", navigator.type)
        }
        completionHandler([.banner, .list, .sound])
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let notification = response.notification
        let request = notification.request
        let content = request.content
        let title = content.title
        let body = content.body
        completionHandler()
    }
}
