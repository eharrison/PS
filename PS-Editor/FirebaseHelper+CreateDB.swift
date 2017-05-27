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
        /*
        messages.append(Message(type: .enablePush,
                                message: "Let me know when you are ready! 🙂",
                                action1: "I'm ready!"))
        
        messages.append(Message(type: .message,
                                message: "Hi! 🙂",
                                date: "2017-06-05 09:02",
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
                                date: "2017-06-05 17:01",
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
        
        // TODO: - ACTION REQUIRED!!!
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
                                date: "2017-06-06 09:03",
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
        
        messages.append(Message(type: .message,
                                message: "Of course I have another mission for you...",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "this one will be to sweeten your day 🙂",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "Already know what it is?",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "well... you will know soon enough. For now, all you have to do is go to office 😉",
                                timeout: 4))
        
        messages.append(Message(type: .message,
                                message: "yes, I know, office this week is not fun...",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "because I'm not there... 😛",
                                timeout: 2))
        
        messages.append(Message(type: .action,
                                message: "Right? 😊",
                                action1: "Right!!"))
        
        messages.append(Message(type: .message,
                                message: "but it can be our secret...",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "we are going to have fun anyways.",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "we are going to smile anyways.",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "we are going to be happy anyways. 🙂",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "Awesome!?",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "ok... so the mission!",
                                timeout: 2))
        
        // TODO: - ACTION REQUIRED!!!
        messages.append(Message(type: .action,
                                message: "Once you get to your desk. Crouch and look under it! 😉",
                                action1: "I have it and I love it!"))
        
        messages.append(Message(type: .options,
                                message: "Do you really love it?",
                                action1: "No 😕.",
                                action2: "Yes!! 😄"))
        
        messages.append(Message(type: .message,
                                message: "I hope you enjoy it! 🙂",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "Now I'll leave you focus on work! 😅",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "Have an AWESOME day!! 😉",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "and have fun at the meetings... 😛",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "(Best thing about not being here today.)",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "ok, ok. I'm out! 😅",
                                timeout: 2))
        */
        // Day 3 / 2 ......
        
        messages.append(Message(type: .message,
                                message: "I'm back!",
                                date: "2017-06-06 18:03",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "Yes, I know. You missed me!",
                                timeout: 2))
        
        messages.append(Message(type: .options,
                                message: "You did, right?",
                                action1: "I guess...",
                                action2: "Yes!! 🙂"))
        
        messages.append(Message(type: .message,
                                message: "I knew it!!",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "It's a gift. And a curse. 😎",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "So, what's the plan now?",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "Tell me, how's your day?",
                                timeout: 2))
        
        messages.append(Message(type: .input,
                                message: "tell me something interesting 😏",
                                needAnswer: true))
        
        messages.append(Message(type: .message,
                                message: "Ha! I shouldn't start with the questions...",
                                timeout: 4))
        
        messages.append(Message(type: .message,
                                message: "I know, I forgot! Can't help it! 🙂",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "As you said before, silence with someone you are comfortable with is not akward. 🙂",
                                timeout: 5))
        
        messages.append(Message(type: .message,
                                message: "let's try it...",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "...",
                                timeout: 3))
        
        messages.append(Message(type: .message,
                                message: "...",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "... (smiling back at you) 😊 ...",
                                timeout: 3))
        
        messages.append(Message(type: .message,
                                message: "...",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "...",
                                timeout: 3))
        
        messages.append(Message(type: .message,
                                message: "Yes! I was very comfortable.",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "You were right!",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "🙂",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "btw, you look stunning today! 😉",
                                timeout: 2))
        
        messages.append(Message(type: .picture,
                                message: "Picture, please! 🙂\nIt's a mission!!",
                                action1: "Take the picture!"))
        
        messages.append(Message(type: .message,
                                message: "it's confirmed.",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "You look amazing!",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "...as always! ☺️",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "...",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "Ok, I'll leave you here!",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "I mean, I'll get back to planning tomorrow...",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "Let's see what I can come up with! 🙂",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "Enjoy the rest of your evening!",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "See you tomorrow!",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "(leaving with a very nice Brazilian goodbye)",
                                timeout: 3))
        
        messages.append(Message(type: .message,
                                message: "🙂",
                                timeout: 1))
        
        // Day 3 / 1 ......
        
        messages.append(Message(type: .message,
                                message: "доброе утро!!",
                                date: "2017-06-07 09:02",
                                timeout: 2))
        
        messages.append(Message(type: .options,
                                message: "Как поживаете?",
                                action1: "🙂",
                                action2: "😊"))
        
        messages.append(Message(type: .message,
                                message: "I hope this week is being fun for you! 🙂",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "btw... did you notice the time I'm buzzing you?",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "It's never even! 🤣",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "I mean, never :00. 😛",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "Just to tease you! 🙃",
                                timeout: 2))
        
        messages.append(Message(type: .options,
                                message: "Is it working?",
                                action1: "Not yet..",
                                action2: "Yes!!!!"))
        
        messages.append(Message(type: .message,
                                message: "good! 😎",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "",
                                timeout: 2))
        
        //.........
        
        
        // Populate database
        var count = 0
        for message in messages {
            save(message: message, id: "\(count)")
            count += 1
        }
    }
    
}
