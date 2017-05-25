//
//  FirebaseHelper+CreateDB.swift
//  PS
//
//  Created by Evandro Harrison Hoffmann on 5/24/17.
//  Copyright © 2017 It's Day Off. All rights reserved.
//

import Foundation

let resetDatabase = true

extension FirebaseHelper {
    
    /// Saves new messages
    static func createDB(){
        
        var messages = [Message]()
        
        messages.append(Message(type: .enablePush,
                                message: "Let me know when you are ready! 🙂",
                                date: "2017-05-25 10:33",
                                action1: "I'm ready!"))
        
        messages.append(Message(type: .message,
                                message: "Hi there!",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "It's a great day!",
                                date: "2017-05-24 8:18",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "It works!",
                                date: "2017-05-24 10:00",
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
    
}
