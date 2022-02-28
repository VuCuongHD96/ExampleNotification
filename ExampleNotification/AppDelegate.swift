//
//  AppDelegate.swift
//  ExampleNotification
//
//  Created by Sun on 07/10/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        MyLocalNotification.registerNotification()
        return true
    }
}

