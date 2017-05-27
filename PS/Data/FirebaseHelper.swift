//
//  FirebaseHelper.swift
//  PS
//
//  Created by Evandro Harrison Hoffmann on 5/22/17.
//  Copyright © 2017 It's Day Off. All rights reserved.
//

import Firebase
import FirebaseDatabase
import FirebaseStorage

class FirebaseHelper: NSObject {
    
    static var resetDatabase = false
    
    static func configure(){
        FIRApp.configure()
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
        
        if let imageUrl = message.imageUrl {
            dictionary[firKey(.imageUrl)] = imageUrl
        }
        
        if let action1 = message.action1 {
            dictionary[firKey(.action1)] = action1
        }
        
        if let action2 = message.action2 {
            dictionary[firKey(.action2)] = action2
        }
        
        let database = FIRDatabase.database().reference()
        
        //in case we are reseting the database, don't update, only replace
        if resetDatabase {
            database.child(firKey(.messages)).child("\(id)").setValue(dictionary)
        }else{
            database.child(firKey(.messages)).child("\(id)").updateChildValues(dictionary)
        }
    }
    
    /// Uploads file
    ///
    /// - Parameters:
    ///   - data: File data
    ///   - completion: returns url in a block
    static func upload(loadingView: UIView? = nil, image: UIImage?, completion: ((_ url: String?)->Void)?) {
        guard let image = image, let data = UIImageJPEGRepresentation(image, 1.0) else {
            completion?(nil)
            return
        }
        
        loadingView?.startLoadingAnimation()
        
        let storageRef = FIRStorage.storage().reference()
        
        let fileRef = storageRef.child("images/\(Date().timeIntervalSince1970).jpg")
            
        _ = fileRef.put(data, metadata: nil) { (metadata, error) in
            loadingView?.stopLoadingAnimation()
            
            guard let metadata = metadata else {
                print("Failed uploading: \(String(describing: error?.localizedDescription))")
                completion?(nil)
                return
            }
            // Metadata contains file metadata such as size, content-type, and download URL.
            let downloadURL = metadata.downloadURL()?.absoluteString
            completion?(downloadURL)
        }
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
                            messageObj.imageUrl = stringValue(messageSnapshot, key: .imageUrl)
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
    case imageUrl = "imageUrl"
    
    case action = "action"
    case actionType = "actionType"
    case action1 = "action1"
    case action2 = "action2"
}

enum FirebaseKeyType: String {
    case message = "message"
    case input = "input"
    case action = "action"
    case picture = "picture"
    case options = "options"
    case enablePush = "enablePush"
}

enum FirebaseKeyAction: String {
    case none = "none"
}
