//
//  UserNotificationCenterDelegate.swift
//  ExampleNotification
//
//  Created by Sun on 28/02/2022.
//

import UserNotifications

class UserNotificationCenterDelegate: NSObject, UNUserNotificationCenterDelegate {
    public func userNotificationCenter(_ center: UNUserNotificationCenter,
                                       willPresent notification: UNNotification,
                                       withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let request = notification.request
        let content = request.content
        let title = content.title
        let body = content.body
        print("------- debug ------- willPresent ------ title = ", title)

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
        print("------- debug ------- didReceive ------ title = ", title)
        completionHandler()
    }
}
