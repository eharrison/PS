//
//  MVLocalNotifications.swift
//  Quests
//
//  Created by Evandro Harrison Hoffmann on 2/20/17.
//  Copyright © 2017 Mindvalley. All rights reserved.
//

import UIKit
import UserNotifications

var didEnablePushNotifications: Bool {
    get {
        return UserDefaults.standard.bool(forKey: "didEnablePushNotifications")
    }
    set {
        UserDefaults.standard.set(newValue, forKey: "didEnablePushNotifications")
    }
}

// MARK: - App Methods

func isNotificationsEnabled(_ completion: @escaping(_ enabled: Bool)->Void) {
    MVNotificationsHelper.isNotificationEnabled { (isEnabled) in
        if !isEnabled {
            completion(false)
            return
        }
        
        //if it's not the first time running the app, start with notificationsEnabled
        if !UserDefaults.standard.bool(forKey: "hasStartedNotifications") {
            UserDefaults.standard.set(true, forKey: "isNotificationsEnabled")
            UserDefaults.standard.set(true, forKey: "hasStartedNotifications")
        }
        
        completion(UserDefaults.standard.bool(forKey: "isNotificationsEnabled"))
    }
}

enum MVNotificationIdentifiers: String {
    case reminder = "reminder"
    case didRecieveNotification = "didReceiveNotification"
}

enum MVNotificationCategories: String {
    case beginContent = "beginContentCategory"
}

enum MVNotificationActions: String {
    case beginNow = "beginNow"
    case remind15 = "remind15"
    case remind30 = "remind30"
}

enum MVNotificationType: String {
    case quest = "notificationQuest"
    case content = "notificationContent"
}

extension MVNotificationsHelper {
    
    static let timeIntervalWindow = 24*6 //every 10 minutes
    
    static func setupNotifications(withMessages messages: [Message]){
        cancelAllNotifications()
        
        isNotificationsEnabled { (isEnabled) in
            if !isEnabled {
                return
            }
            
            for message in messages {
                if let id = message.id, let notificationDate = message.date?.toDate(format: "yyyy-MM-dd HH:mm") {
                    
                    let type = NotificationType.dayReminder.rawValue
                    let category = MVNotificationCategories.beginContent.rawValue
                    
                    scheduleNotification(NotificationItem(
                        message: "Hi!! I've got something new for you! 🙂",
                        actionName: "Read it".localized,
                        date: notificationDate,
                        objectType: type,
                        objectId: 0,
                        category: category,
                        badgeNumber: 1,
                        identifier: "\(MVNotificationIdentifiers.reminder.rawValue)_\(id)"))
                }
            }
            
            addNotificationActions()
            
            //set app delegate to listen to notifications
            if #available(iOS 10.0, *) {
                UNUserNotificationCenter.current().delegate = UIApplication.shared.delegate as! AppDelegate
            }
        }
    }
    
    static func addNotificationActions(){
        guard #available(iOS 10.0, *) else {
            return
        }
        
        addNotificationActions(notificationCategories: [(MVNotificationCategories.beginContent.rawValue,
                                                         [(MVNotificationActions.beginNow.rawValue, MVNotificationActions.beginNow.rawValue.localized, .foreground),
                                                          (MVNotificationActions.remind15.rawValue, MVNotificationActions.remind15.rawValue.localized, nil),
                                                          (MVNotificationActions.remind30.rawValue, MVNotificationActions.remind30.rawValue.localized, nil)])])
    }
    
    @available(iOS 10.0, *)
    static func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        switch response.actionIdentifier {
        case UNNotificationDismissActionIdentifier:
            print("Dismiss Action")
            break
        case UNNotificationDefaultActionIdentifier:
            print("Default")
            openContent(withResponse: response)
            break
        case MVNotificationActions.beginNow.rawValue:
            print("Begin now")
            openContent(withResponse: response)
            break
        case MVNotificationActions.remind15.rawValue:
            print("Remind 15")
            scheduleReminder(withResponse: response, date: Date().addingTimeInterval(60*15))
            break
        case MVNotificationActions.remind30.rawValue:
            print("Remind 30")
            scheduleReminder(withResponse: response, date: Date().addingTimeInterval(60*30))
            break
        default:
            print("Unknown action")
        }
        completionHandler()
    }
    
    @available(iOS 10.0, *)
    static func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.sound])
    }
    
    static func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
    }
}

// MARK: - Notification events

extension MVNotificationsHelper {
    
    @available(iOS 10.0, *)
    static func scheduleReminder(withResponse response: UNNotificationResponse, date: Date) {
        print("Rescheduling notification for \(date)")
        
        let notificationItem = NotificationItem(identifier: response.notification.request.identifier)
        
        scheduleNotification(notificationItem)
    }
    
    @available(iOS 10.0, *)
    static func openContent(withResponse response: UNNotificationResponse) {
        print("Opening content for notification")
    }
    
}

// MARK: - Generic Methods

enum MVNotificationUserInfoType: String {
    case message = "message"
    case actionName = "actionName"
    case objectType = "objectType"
    case objectId = "objectId"
    case badge = "badge"
    case category = "category"
}

struct MVNotificationsHelper {
    
    // MARK: - Configuration
    
    static func enableNotifications(withApplication application: UIApplication, callback: ((_ granted: Bool, _ message: String?)->Void)? = nil){
        
        if #available(iOS 10, *) {
            let center = UNUserNotificationCenter.current()
            center.delegate = UIApplication.shared.delegate as! AppDelegate
            center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
                callback?(granted, error?.localizedDescription)
            }
            UIApplication.shared.registerForRemoteNotifications()
        } else {
            let types : UIUserNotificationType = [.alert, .badge, .sound]
            let setting : UIUserNotificationSettings = UIUserNotificationSettings(types:types, categories:nil)
            UIApplication.shared.registerUserNotificationSettings(setting)
            UIApplication.shared.registerForRemoteNotifications()
            
            callback?(true, nil)
        }
    }
    
    static func isNotificationEnabled(_ completion:@escaping(_ enabled: Bool)->Void) {
        guard #available(iOS 10.0, *) else {
            if let settings = UIApplication.shared.currentUserNotificationSettings{
                if settings.types.contains(.alert){
                    completion(true)
                    
                    return
                }
            }
            completion(false)
            return
        }
        
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            if settings.authorizationStatus == .authorized {
                completion(true)
            }else {
                completion(false)
            }
        }
    }
    
    static func isRegisteredForRemoteNotifications() -> Bool {
        if UIApplication.shared.isRegisteredForRemoteNotifications {
            return true
        } else {
            return false
        }
    }
    
    static func scheduleNotification(_ notificationItem: NotificationItem){
        //only proceed if date is in the future
        if notificationItem.date < Date() {
            return
        }
        
        // notifications previews iOS 10
        guard #available(iOS 10.0, *) else {
            let notification = UILocalNotification()
            notification.alertBody = "\(notificationItem.message)"
            notification.alertAction = notificationItem.actionName
            notification.fireDate = notificationItem.date
            notification.applicationIconBadgeNumber = notificationItem.badgeNumber
            notification.soundName = UILocalNotificationDefaultSoundName
            notification.userInfo = [MVNotificationUserInfoType.message.rawValue: notificationItem.message,
                                     MVNotificationUserInfoType.actionName.rawValue: notificationItem.actionName,
                                     MVNotificationUserInfoType.objectType.rawValue: notificationItem.objectType,
                                     MVNotificationUserInfoType.objectId.rawValue: notificationItem.objectId,
                                     MVNotificationUserInfoType.badge.rawValue: notificationItem.badgeNumber,
                                     MVNotificationUserInfoType.category.rawValue: notificationItem.category]
            
            print("registering notification for the date: \(notification.fireDate!) with the information: \(notification.userInfo!)")
            
            UIApplication.shared.scheduleLocalNotification(notification)
            
            return
        }
        
        // notifications iOS 10+
        
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents(in: .current, from: notificationItem.date)
        let newComponents = DateComponents(calendar: calendar, timeZone: .current, month: components.month, day: components.day, hour: components.hour, minute: components.minute, second: components.second)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: newComponents, repeats: false)
        
        let content = UNMutableNotificationContent()
        if let title = notificationItem.title {
            content.title = title
        }
        content.body = notificationItem.message
        content.sound = UNNotificationSound.default()
        content.userInfo = [MVNotificationUserInfoType.message.rawValue: notificationItem.message,
                            MVNotificationUserInfoType.actionName.rawValue: notificationItem.actionName,
                            MVNotificationUserInfoType.objectType.rawValue: notificationItem.objectType,
                            MVNotificationUserInfoType.objectId.rawValue: notificationItem.objectId,
                            MVNotificationUserInfoType.badge.rawValue: notificationItem.badgeNumber,
                            MVNotificationUserInfoType.category.rawValue: notificationItem.category]
        
        //add actions category
        if notificationItem.category.characters.count > 0 {
            content.categoryIdentifier = notificationItem.category
        }
        
        //create the message request and send it
        let request = UNNotificationRequest(identifier: notificationItem.identifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) {(error) in
            if let error = error {
                print("Uh oh! We had an error: \(error)")
            }
        }
    }
    
    static func cancelAllNotifications(){
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        } else {
            UIApplication.shared.cancelAllLocalNotifications()
        }
    }
    
    // MARK: - Actions
    
    /// Adds actions to Notifications
    ///
    /// - Parameter notificationCategories: [categoryName, [actionIdentifier, actionTitle]]
    @available(iOS 10.0, *)
    static func addNotificationActions(notificationCategories: [(String, [(String, String, UNNotificationActionOptions?)])]){
        var categories = Set<UNNotificationCategory>()
        
        for notificationCategory in notificationCategories {
            var actions = [UNNotificationAction]()
            
            for notificationAction in notificationCategory.1 {
                let action = UNNotificationAction(identifier: notificationAction.0, title: notificationAction.1, options: notificationAction.2 ?? [])
                
                actions.append(action)
            }
            
            categories.insert(UNNotificationCategory(identifier: notificationCategory.0, actions: actions, intentIdentifiers: [], options: []))
        }
        
        UNUserNotificationCenter.current().setNotificationCategories(categories)
    }
    
    // MARK: - Popups
    
    static func showRemindOptions(withViewController viewController: UIViewController, callback:(()->Void)? = nil){
        let alertController = UIAlertController(title: nil, message: NSLocalizedString("When do you want me to remind you?", comment: ""), preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: NSLocalizedString("In 15 Minutes", comment: ""), style: .default, handler: { (action) in
            callback?()
        }))
        alertController.addAction(UIAlertAction(title: NSLocalizedString("In 1 Hour", comment: ""), style: .default, handler: { (action) in
            callback?()
        }))
        alertController.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: { (action) in
            callback?()
        }))
        
        viewController.present(alertController, animated: true, completion: nil)
    }
    
}

// MARK: - UIViewController extensions

extension UIViewController {
    
    func showRemindOptions(callback:(()->Void)? = nil){
        MVNotificationsHelper.showRemindOptions(withViewController: self, callback: callback)
    }
    
}

struct NotificationItem {
    var title: String?
    var message: String
    var actionName: String
    var date: Date
    var objectType: String
    var objectId: NSNumber
    var category: String
    var badgeNumber = 1
    var identifier: String
    var attachmentUrl: String?
    var deeplink: String?
    var imageUrl: String?
    var questId: Int
    var dayId: Int
    var introId: Int
    var tribeId: Int
    var postId: Int
    
    init(title: String? = nil, message: String = "", actionName: String = "", date: Date = Date(), objectType: String = "", objectId: NSNumber = NSNumber(value: 0), category: String = "", badgeNumber: Int = 1, identifier: String = "", attachmentUrl: String = "", deeplink: String = "", imageUrl: String = "", questId: Int = 0, dayId: Int = 0, introId: Int = 0, tribeId: Int = 0, postId: Int = 0) {
        self.title = title
        self.message = message
        self.actionName = actionName
        self.date = date
        self.objectType = objectType
        self.objectId = objectId
        self.category = category
        self.badgeNumber = badgeNumber
        self.identifier = identifier
        self.attachmentUrl = attachmentUrl
        self.deeplink = deeplink
        self.imageUrl = imageUrl
        self.questId = questId
        self.dayId = dayId
        self.introId = introId
        self.tribeId = tribeId
        self.postId = postId
    }
}

enum NotificationType: String {
    case dayReminder = "kNotificationDayReminder"
    case challenge = "kNotificationChallenge"
}
