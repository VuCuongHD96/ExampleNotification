//
//  AppDelegate.swift
//  ExampleNotification
//
//  Created by Sun on 07/10/2021.
//

import UIKit
import  UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?

    let remoteNotification = MyRemoteNotification()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        remoteNotification.registerForPushNotifications()
        
        
        
        return true
    }
}
