//
//  MyNotification.swift
//  ExampleNotification
//
//  Created by Sun on 02/11/2021.
//

import  UserNotifications

class MyNotification: NSObject {
    let notificationCenter = UNUserNotificationCenter.current()
    let delegate = UserNotificationCenterDelegate()
    
    func registerForPushNotifications() {
        notificationCenter.delegate = delegate
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
            print("Permission granted: \(granted)")
        }
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
    
    func pushNotif(with content: NotificationContent, after second: TimeInterval) {
        // Step 4: Create the request
        let request = createRequest(content: content, second: second)

        // Step 5: Register the request
        notificationCenter.add(request) { (error) in
            // Check the error parameter and handle any errors
        }
    }
}
