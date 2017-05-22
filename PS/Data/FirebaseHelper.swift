//
//  FirebaseHelper.swift
//  PS
//
//  Created by Evandro Harrison Hoffmann on 5/22/17.
//  Copyright © 2017 It's Day Off. All rights reserved.
//

import Firebase
import FirebaseDatabase

enum FirebaseKey: String {
    case messages = "messages"
    case message = "message"
}

class FirebaseHelper: NSObject {
    
    static func configure(){
        FIRApp.configure()
    }
    
    static func save(){
        let database = FIRDatabase.database().reference()
        
        database.child(FirebaseKey.messages.rawValue).child("1").setValue([FirebaseKey.messages.rawValue: "Hi there!"])
        database.child(FirebaseKey.messages.rawValue).child("2").setValue([FirebaseKey.message.rawValue: "I'm here!"])
        database.child(FirebaseKey.messages.rawValue).child("3").setValue([FirebaseKey.message.rawValue: "Bla bla bla"])
    }
    
    static func messages(_ completion:@escaping ((_ messages: [Message])->Void)){
        let database = FIRDatabase.database().reference()
        _ = database.observe(.value, with: { (snapshot) in
            var messages = [Message]()
            
            for child in snapshot.children {
                if let messagesSnapshot = child as? FIRDataSnapshot {
                    for child in messagesSnapshot.children {
                        if let messageSnapshot = child as? FIRDataSnapshot {
                            if let message = messageSnapshot.childSnapshot(forPath: FirebaseKey.message.rawValue).value as? String {
                                messages.append(Message(message: message))
                            }
                        }
                    }
                }
            }
            
            completion(messages)
        })
    }
    
}

struct Message {
    var message: String?
}
