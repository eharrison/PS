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
        
//        messages.append(Message(type: .enablePush,
//                                message: "Let me know when you are ready! 🙂",
//                                date: "2017-05-25 10:33",
//                                action1: "I'm ready!"))
//        
//        messages.append(Message(type: .message,
//                                message: "Hi! 🙂",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "It's a great day! Isn't it?",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "...or at least we can make it a great day! 🙂",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "What do you think?",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "I have a plan!",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "But before... I have a question...",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "Because I can't seem to remember... 😅",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "What is... your name again?",
//                                timeout: 2))
//        
//        messages.append(Message(type: .input,
//                                message: "Your name...",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "Oh, I just remembered!",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "Ириночка!",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "🙂",
//                                timeout: 1))
//        
//        messages.append(Message(type: .message,
//                                message: "BTW, I do you want me to speak Russian?",
//                                timeout: 2))
//        
//        messages.append(Message(type: .options,
//                                message: "Speak Russian",
//                                action1: "Yes",
//                                action2: "No"))
//        
//        messages.append(Message(type: .message,
//                                message: "Just kidding! I can't... 😂",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "Anyways... back to the plan!",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "hmmmm...",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "Actually, I won't tell you! 😏",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "...I'll give you some clues instead.",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "...but, you gotta promisse to not cheat! 🤓",
//                                timeout: 2))
//        
//        messages.append(Message(type: .options,
//                                message: "deal?",
//                                action1: "Yes",
//                                action2: "No"))
//        
//        messages.append(Message(type: .message,
//                                message: "I'll believe you! 🙃",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "Ok, so here's the plan...",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "I'll give you a few missions.",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "YES, MISSIONS!!!",
//                                timeout: 1))
//        
//        messages.append(Message(type: .message,
//                                message: "just felt important, right?",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "👨🏻‍🌾",
//                                timeout: 1))
//        
//        messages.append(Message(type: .message,
//                                message: "ok... MISSION 1",
//                                timeout: 2))
//        
//        messages.append(Message(type: .action,
//                                message: "At my desk, by the window, there is something wrapped in newspaper. Get it, and put it on your bag (you might need it later 🙂).\nPS. you can get a chocolate from the can too! 🙂",
//                                action1: "Done!"))
//        
//        messages.append(Message(type: .message,
//                                message: "Awesome!!\nYou just finished your first mission! 🙂",
//                                timeout: 3))
//        
//        messages.append(Message(type: .message,
//                                message: "ok ok, that's it for now!",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "I'll be back later with more missions... be ready!! 😉",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "Have an awesome day! 😎",
//                                timeout: 2))
        
        //......
        
        messages.append(Message(type: .message,
                                message: "Hi again!!\nI hope your day was awesome! 😎",
                                timeout: 3))
        
        ///
        
        messages.append(Message(type: .message,
                                message: "When you are on your way home, I need you to get something for me...",
                                timeout: 4))
        
        messages.append(Message(type: .message,
                                message: "Don't worry, it's easy...",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "And it's not a bomb either",
                                timeout: 2))
        
        //......
        
        messages.append(Message(type: .action,
                                message: "Only continue if you already picked it up! No cheating!! 🙂",
                                date: "2017-05-25 14:17",
                                action1: "I picked it up!"))

        
        
        
        
        
        
        
//
//        messages.append(Message(type: .options,
//                                message: "Choose!!",
//                                date: "2017-05-17 11:00",
//                                action1: "Yes",
//                                action2: "No"))
        
        
        // Populate database
        var count = 0
        for message in messages {
            save(message: message, id: "\(count)")
            count += 1
        }
    }
    
}
