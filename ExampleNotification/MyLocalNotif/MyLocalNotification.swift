//
//  MyLocalNotification.swift
//  ExampleNotification
//
//  Created by Sun on 08/10/2021.
//

import UserNotifications

protocol MyLocalNotificationType {
    static func registerNotification() 
    func pushNotif(with content: NotificationContent, after second: TimeInterval)
}

public class MyLocalNotification: NSObject {

    // MARK: - Property
    static let shared = MyLocalNotification()
    
    private var center: UNUserNotificationCenter {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        return center
    }

    // MARK: - Init
    private override init() {
        super.init()
        let openAction = UNNotificationAction(identifier: "open", title: "Open", options: [.foreground])
        let dismissAction = UNNotificationAction(identifier: UNNotificationDismissActionIdentifier, title: "Dismiss", options: [.destructive])
        let actionCategory = UNNotificationCategory(identifier: "category", actions: [openAction, dismissAction], intentIdentifiers: [], options: .customDismissAction)
        center.setNotificationCategories([actionCategory])
    }

    // MARK: - Create item
    private func createContent(_ myContent: NotificationContent) -> UNMutableNotificationContent {
        let content = UNMutableNotificationContent()
        content.title = myContent.title
        content.body = myContent.body
        return content
    }
    
    private func createTrigger(with second: TimeInterval) -> UNCalendarNotificationTrigger {
        let date = Date().addingTimeInterval(second)
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        return trigger
    }
    
    private func createRequest(content: NotificationContent, second: TimeInterval) -> UNNotificationRequest {
        let uuidString = UUID().uuidString
        
        // Step 2: Create the notification content
        let content = createContent(content)
        
        // Step 3: Create the notification trigger
        let trigger = createTrigger(with: second)
        
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        return request
    }
}

extension MyLocalNotification: MyLocalNotificationType {
    static func registerNotification() {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound]) { (granted, error) in
                print("------ debug Granted = \(granted)")
            }
    }

    func pushNotif(with content: NotificationContent, after second: TimeInterval) {
        // Step 4: Create the request
        let request = createRequest(content: content, second: second)

        // Step 5: Register the request
        center.add(request) { (error) in
            // Check the error parameter and handle any errors
        }
    }
}

extension MyLocalNotification: UNUserNotificationCenterDelegate {
    public func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        print("---------- Local notif willPresent -------- ")
        
        completionHandler([.banner, .list, .sound])
    }
}
