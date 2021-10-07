//
//  AppDelegate.swift
//  ExampleNotification
//
//  Created by Sun on 07/10/2021.
//

import UIKit
import  UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let myNotification = MyNotification()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        myNotification.registerForPushNotifications()
        showNotif()
        return true
    }
    
    private func showNotif() {
        let content = NotificationContent(title: "aaaa", body: "bbbb")
        myNotification.pushNotif(with: content, after: 2)
    }
}
