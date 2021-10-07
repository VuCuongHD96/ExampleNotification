//
//  ViewController.swift
//  ExampleNotification
//
//  Created by Sun on 07/10/2021.
//

import UIKit
import UserNotifications

final class ViewController: UIViewController {
    
    // MARK: - Property
    let myLocalNotif: MyLocalNotificationType = MyLocalNotification.shared
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        showNotif()
    }
    
    private func showNotif() {
        let content = NotificationContent(title: "This is title",
                                          body: "This is body")
        myLocalNotif.pushNotif(with: content, after: 5)
    }
}
