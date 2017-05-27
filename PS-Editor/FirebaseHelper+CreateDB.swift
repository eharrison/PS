//
//  FirebaseHelper+CreateDB.swift
//  PS
//
//  Created by Evandro Harrison Hoffmann on 5/24/17.
//  Copyright © 2017 It's Day Off. All rights reserved.
//

import Foundation

extension FirebaseHelper {
    
    /// Saves new messages
    static func createDB(){
        
        var messages = [Message]()
        
        // Day 1 / 1 ......
        
        messages.append(Message(type: .enablePush,
                                message: "Let me know when you are ready! 🙂",
                                action1: "I'm ready!"))
        
        messages.append(Message(type: .message,
                                message: "Hi! 🙂",
                                date: "2017-06-05 09:00",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "It's a great day! Isn't it?",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "...or at least we can make it a great day! 🙂",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "What do you think?",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "I have a plan!",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "But before... I have a question...",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "Because I can't seem to remember... 😅",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "What is... your name again?",
                                timeout: 2))
        
        messages.append(Message(type: .input,
                                message: "Your name...",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "Oh, I just remembered!",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "Ириночка!",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "🙂",
                                timeout: 1))
        
        messages.append(Message(type: .message,
                                message: "BTW, I do you want me to speak Russian?",
                                timeout: 2))
        
        messages.append(Message(type: .options,
                                message: "Speak Russian",
                                action1: "No",
                                action2: "Yes"))

        messages.append(Message(type: .message,
                                message: "Just kidding! I can't... 😂",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "Anyways... back to the plan!",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "hmmmm...",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "Actually, I won't tell you! 😏",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "...I'll give you some clues instead.",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "...but, you gotta promisse to not cheat! 🤓",
                                timeout: 2))
        
        messages.append(Message(type: .options,
                                message: "deal?",
                                action1: "No",
                                action2: "Yes"))

        messages.append(Message(type: .message,
                                message: "I'll believe you! 🙃",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "Ok, so here's the plan...",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "I'll give you a few missions.",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "YES, MISSIONS!!!",
                                timeout: 1))
        
        messages.append(Message(type: .message,
                                message: "just felt important, right?",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "👨🏻‍🌾",
                                timeout: 1))
        
        messages.append(Message(type: .message,
                                message: "ok... MISSION 1",
                                timeout: 2))
        
        messages.append(Message(type: .action,
                                message: "At my desk, by the window, there is something wrapped in newspaper. Get it, and put it on your bag (you might need it later. Exciting, right? 🙂).\nPS. you can get a chocolate from the can too! 🙂",
                                action1: "Done!"))

        messages.append(Message(type: .message,
                                message: "Awesome!!\nYou just finished your first mission! 🙂",
                                timeout: 3))
        
        messages.append(Message(type: .message,
                                message: "ok ok, that's it for now!",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "I'll be back later with more missions... be ready!! 😉",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "Have an awesome day! 😎",
                                timeout: 2))
        
        // Day 1 / 2 ......
        
        messages.append(Message(type: .message,
                                message: "Hi again!!\nI hope your day was awesome! 😎",
                                date: "2017-06-05 17:00",
                                timeout: 3))
        
        messages.append(Message(type: .message,
                                message: "Well, it's not over yet...",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "I have another mission for you!",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "yes, really exciting!",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "Right? 🙂",
                                timeout: 1))
        
        messages.append(Message(type: .message,
                                message: "ok... here it goes.",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "MISSION 2",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "When you are on your way home, I need you to get something for me...",
                                timeout: 4))
        
        messages.append(Message(type: .message,
                                message: "Don't worry, it's easy...",
                                timeout: 2))
        
        /////Check and update
        messages.append(Message(type: .action,
                                message: "Take the LRT, get off at the KLCC station and move towards home as usually. After you climb the stairs, entering Suria Mall, look to the left, there is this place called `Lysha Flora`. Ask about a delivery for you.\nOnly continue if you already picked it up! No cheating!! 🙂",
                                action1: "I have it!"))
        
        messages.append(Message(type: .action,
                                message: "You are not cheating, are you?",
                                action1: "Of course not!"))
        
        messages.append(Message(type: .message,
                                message: "Ok, I believe you! 🙂",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "So, now you can go get your dinner in ISETAN.\nBut no sweeties for today!! 😛",
                                timeout: 4))
        
        messages.append(Message(type: .action,
                                message: "As soon as you get home, let me know...",
                                action1: "I'm home!"))
        
        messages.append(Message(type: .action,
                                message: "Awesome!! So you know what to do! TIP: Use what you got in the office in the morning! 😊",
                                action1: "It's done!"))
        
        messages.append(Message(type: .message,
                                message: "So...",
                                timeout: 1))
        
        messages.append(Message(type: .message,
                                message: "Roses, because you like flowers.",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "3, Because you like this number (remember my mind reading magic? 🎩)",
                                timeout: 4))
        
        messages.append(Message(type: .message,
                                message: "White and Red, because they are your favourites.",
                                timeout: 4))
        
        messages.append(Message(type: .message,
                                message: "I hope I could make you smile... 🙂",
                                timeout: 3))
        
        messages.append(Message(type: .options,
                                message: "Did you like it?",
                                action1: "No",
                                action2: "Yes"))
        
        messages.append(Message(type: .input,
                                message: "How do you feel right now?",
                                needAnswer: true))

        messages.append(Message(type: .picture,
                                message: "Awesome!! I'm curious!\nYour mission now is to send me a picture. 😊",
                                action1: "Send it!"))
        
        messages.append(Message(type: .message,
                                message: "Yay! Enjoy your dinner and the rest of your night!",
                                timeout: 3))
        
        messages.append(Message(type: .message,
                                message: "Talk to you tomorrow! 😉",
                                timeout: 2))

        messages.append(Message(type: .message,
                                message: "...Brazilian goodbye! 🙂",
                                timeout: 2))
 
        // Day 2 / 1 ......
        
        messages.append(Message(type: .message,
                                message: "Good morning!! 🙂",
                                date: "2017-06-06 09:00",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "It's a beautiful day, isn't it? 😊",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "I hope you enjoyed yesterday.",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "I sure did enjoy planning it. 🙂",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "So...",
                                timeout: 1))
        
        messages.append(Message(type: .message,
                                message: "You told me more than once, that every day should/could be special.",
                                timeout: 3))
        
        messages.append(Message(type: .message,
                                message: "Right? 😉",
                                timeout: 1))
        
        messages.append(Message(type: .message,
                                message: "I think so too!",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "I'm here to make sure every single day is special for you.",
                                timeout: 3))
        
        messages.append(Message(type: .message,
                                message: "Because you are special. 🙂",
                                timeout: 2))
        
        messages.append(Message(type: .action,
                                message: "What do you say?\nReady for a special day?",
                                action1: "Yes!!"))
        
        // Day 3 / 1 ......
        
        messages.append(Message(type: .action,
                                message: "доброе",
                                action1: "Yes!!"))

        
        
        // Populate database
        var count = 0
        for message in messages {
            save(message: message, id: "\(count)")
            count += 1
        }
    }
    
}
