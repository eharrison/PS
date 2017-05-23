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
    
    /// Saves new messages
    static func createDB(){
        
        var messages = [Message]()
        
        messages.append(Message(type: .message,
                                message: "Hi there!",
                                date: "2017-05-17 08:00",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "It's a great day!",
                                date: "2017-05-17 09:00",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "It works!",
                                date: "2017-05-17 10:00",
                                timeout: 2))
        
        messages.append(Message(type: .input,
                                message: "What's your name?",
                                date: "2017-05-17 11:00",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "Wooohooo!",
                                date: "2017-05-17 11:00",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "hahah!",
                                date: "2017-05-17 11:00",
                                timeout: 2))
        
        messages.append(Message(type: .action,
                                date: "2017-05-17 11:00",
                                action1: "Click here!!"))
        
        messages.append(Message(type: .options,
                                message: "Choose!!",
                                date: "2017-05-17 11:00",
                                action1: "Yes",
                                action2: "No"))
        
        
        // Populate database
        var count = 0
        for message in messages {
            save(message: message, id: "\(count)")
            count += 1
        }
    }
    
    /// Updates a message
    ///
    /// - Parameter message: Message Object
    static func save(message: Message, id: String? = nil) {
        guard let id = message.id ?? id else {
            return
        }
        
        var dictionary = [String: Any]()
        dictionary[firKey(.type)] = message.type.rawValue
        dictionary[firKey(.timeout)] = message.timeout
        dictionary[firKey(.waitTime)] = message.waitTime
        dictionary[firKey(.action)] = message.action.rawValue
        dictionary[firKey(.needAnswer)] = message.needAnswer
        
        if let message = message.message {
            dictionary[firKey(.message)] = message
        }
        
        if let date = message.date {
            dictionary[firKey(.date)] = date
        }
        
        if let readAt = message.readAt {
            dictionary[firKey(.read)] = message.read
            dictionary[firKey(.readAt)] = readAt
        }
        
        if let answer = message.answer {
            dictionary[firKey(.answer)] = answer
        }
        
        if let action1 = message.action1 {
            dictionary[firKey(.action1)] = action1
        }
        
        if let action2 = message.action2 {
            dictionary[firKey(.action2)] = action2
        }
        
        let database = FIRDatabase.database().reference()
        database.child(firKey(.messages)).child("\(id)").updateChildValues(dictionary)
    }
    
    /// Fetches all messages
    ///
    /// - Parameter completion: completion callback
    static func messages(_ completion:@escaping ((_ messages: [Message])->Void)){
        let database = FIRDatabase.database().reference()
        _ = database.observe(.value, with: { (snapshot) in
            var messages = [Message]()
            
            for child in snapshot.children {
                if let messagesSnapshot = child as? FIRDataSnapshot {
                    for child in messagesSnapshot.children {
                        if let messageSnapshot = child as? FIRDataSnapshot {
                            var messageObj = Message()
                            
                            messageObj.id = messageSnapshot.key
                            messageObj.type = firKeyValue(messageSnapshot, key: .type)
                            messageObj.message = stringValue(messageSnapshot, key: .message)
                            messageObj.date = stringValue(messageSnapshot, key: .date)
                            messageObj.read = boolValue(messageSnapshot, key: .read)
                            messageObj.readAt = stringValue(messageSnapshot, key: .readAt)
                            messageObj.timeout = doubleValue(messageSnapshot, key: .timeout)
                            messageObj.waitTime = doubleValue(messageSnapshot, key: .waitTime)
                            messageObj.answer = stringValue(messageSnapshot, key: .answer)
                            messageObj.needAnswer = boolValue(messageSnapshot, key: .needAnswer)
                            messageObj.action = firActionValue(messageSnapshot, key: .action)
                            messageObj.action1 = stringValue(messageSnapshot, key: .action1)
                            messageObj.action2 = stringValue(messageSnapshot, key: .action2)
                            
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
    
    static func firActionValue(_ from: FIRDataSnapshot, key: FirebaseKey) -> FirebaseKeyAction {
        if let value = from.childSnapshot(forPath: firKey(key)).value as? String {
            return FirebaseKeyAction(rawValue: value) ?? .none
        }
        
        return .none
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
    case needAnswer = "needAnswer"
    case timeout = "timeout"
    case waitTime = "waitTime"
    
    case action = "action"
    case actionType = "actionType"
    case action1 = "action1"
    case action2 = "action2"
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
    var action: FirebaseKeyAction = .none
    var date: String?
    var read: Bool = false
    var readAt: String?
    var answer: String?
    var needAnswer: Bool = false
    var timeout: Double = 0
    var waitTime: Double = 0
    var action1: String?
    var action2: String?
    
    init(id: String? = nil, type: FirebaseKeyType = .message, message: String? = nil, action: FirebaseKeyAction = .none, date: String? = nil, read: Bool = false, readAt: String? = nil, answer: String? = nil, needAnswer: Bool = false, timeout: Double = 0, waitTime: Double = 0, action1: String? = nil, action2: String? = nil) {
        self.id = id
        self.message = message
        self.type = type
        self.action = action
        self.date = date
        self.read = read
        self.readAt = readAt
        self.timeout = timeout
        self.waitTime = waitTime
        self.answer = answer
        self.needAnswer = needAnswer
        self.action1 = action1
        self.action2 = action2
    }
}
