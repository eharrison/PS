//
//  FirebaseHelper.swift
//  PS
//
//  Created by Evandro Harrison Hoffmann on 5/22/17.
//  Copyright © 2017 It's Day Off. All rights reserved.
//

import Firebase
import FirebaseDatabase

class FirebaseHelper: NSObject {
    
    static func configure(){
        FIRApp.configure()
    }
    
    static func save(){
        
        var messages = [[String: Any]]()
        
        messages.append([
            firKey(.type): firKeyType(.message),
            firKey(.message): "Hi there!",
            firKey(.date): "2017-05-17 08:00",
            firKey(.timeout): 0,
            firKey(.waitTime): 0,
            firKey(.action): firAction(.none)])
        
        messages.append([firKey(.message): "It's great to see you"])
        messages.append([firKey(.message): "You are awesome!"])
        messages.append([firKey(.message): "Amazing!!"])
        
        // Populate database
        
        let database = FIRDatabase.database().reference()
        
        var count = 0
        for message in messages {
            database.child(firKey(.messages)).child("\(count)").setValue(message)
            count += 1
        }
    }
    
    static func messages(_ completion:@escaping ((_ messages: [Message])->Void)){
        let database = FIRDatabase.database().reference()
        _ = database.observe(.value, with: { (snapshot) in
            var messages = [Message]()
            
            for child in snapshot.children {
                if let messagesSnapshot = child as? FIRDataSnapshot {
                    for child in messagesSnapshot.children {
                        if let messageSnapshot = child as? FIRDataSnapshot {
                            var messageObj = Message()
                            
                            messageObj.type = firKeyValue(messageSnapshot, key: .type)
                            messageObj.message = stringValue(messageSnapshot, key: .message)
                            messageObj.date = stringValue(messageSnapshot, key: .date)
                            messageObj.read = boolValue(messageSnapshot, key: .read)
                            messageObj.timeout = doubleValue(messageSnapshot, key: .timeout)
                            messageObj.waitTime = doubleValue(messageSnapshot, key: .waitTime)
                            
                            messages.append(messageObj)
                        }
                    }
                }
            }
            
            completion(messages)
        })
    }
}

// MARK: - Formaters

extension FirebaseHelper {
    
    static func stringValue(_ from: FIRDataSnapshot, key: FirebaseKey) -> String? {
        if let value = from.childSnapshot(forPath: firKey(key)).value as? String {
            return value
        }
        
        return nil
    }
    
    static func boolValue(_ from: FIRDataSnapshot, key: FirebaseKey) -> Bool {
        if let value = from.childSnapshot(forPath: firKey(key)).value as? Bool {
            return value
        }
        
        return false
    }
    
    static func doubleValue(_ from: FIRDataSnapshot, key: FirebaseKey) -> Double {
        if let value = from.childSnapshot(forPath: firKey(key)).value as? Double {
            return value
        }
        
        return 0
    }
    
    static func firKeyValue(_ from: FIRDataSnapshot, key: FirebaseKey) -> FirebaseKeyType {
        if let value = from.childSnapshot(forPath: firKey(key)).value as? String {
            return FirebaseKeyType(rawValue: value) ?? .message
        }
        
        return .message
    }
    
}

// MARK: - Enumerators

extension FirebaseHelper {
    static func firKey(_ type: FirebaseKey) -> String {
        return type.rawValue
    }
    
    static func firKeyType(_ type: FirebaseKeyType) -> String {
        return type.rawValue
    }
    
    static func firAction(_ type: FirebaseKeyAction) -> String {
        return type.rawValue
    }
}

enum FirebaseKey: String {
    case messages = "messages"
    case id = "id"
    case message = "message"
    case date = "date"
    case type = "type"
    case read = "read"
    case readAt = "readAt"
    case answer = "answer"
    case timeout = "timeout"
    case waitTime = "waitTime"
    
    case action = "action"
    case actionType = "actionType"
    
    case options = "options"
    case option = "option"
}

enum FirebaseKeyType: String {
    case message = "message"
    case input = "input"
    case action = "action"
    case options = "options"
}

enum FirebaseKeyAction: String {
    case none = "none"
}

// MARK: - Objects

struct Message {
    var message: String?
    var id: String?
    var type: FirebaseKeyType = .message
    var date: String?
    var read: Bool = false
    var readAt: String?
    var timeout: Double = 0
    var waitTime: Double = 0
    
    init() {
        
    }
}
