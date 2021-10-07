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
    
    let myRemoteNotification = MyRemoteNotification()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        MyLocalNotification.registerNotification()
        myRemoteNotification.registerForPushNotifications()
        return true
    }
}
