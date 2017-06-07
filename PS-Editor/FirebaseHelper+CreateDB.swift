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
        
        // Day 1 / 1 - 2017-06-05 (Monday)
        
        messages.append(Message(type: .message,
                                message: "Hi! 🙂",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "Great to see you!",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "This is going to be so cool!",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "I mean, классно! ☺️",
                                timeout: 2))
        
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
                                message: "BTW, I do you want me to speak русски?",
                                timeout: 2))
        
        messages.append(Message(type: .options,
                                message: "Speak Russian",
                                action1: "No",
                                action2: "Yes"))

        messages.append(Message(type: .message,
                                message: "Just kidding! Not your choice... 😂",
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
                                message: "...but, you gotta promise to not cheat! 🤓",
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
                                message: "🙂",
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
        
        // Day 1 / 2 - 2017-06-05 (Monday)
        
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
        
        messages.append(Message(type: .action,
                                message: "Take the LRT, get off at the KLCC station and move towards home as usually. After you climb the stairs, entering Suria Mall, look to the left, there is this place called `Lysha Flora`. Ask about a delivery for you. 🙂\nOnly continue if you already picked it up! No cheating!! 🙂",
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
                                needAnswer: true,
                                timeout:0))

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
 
        // Day 2 / 1 - 2017-06-06 (Tuesday)
        
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
                                message: "классно!?",
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
 
        // Day 3 / 2 - 2017-06-06 (Tuesday)
        
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
                                needAnswer: true,
                                timeout:0))
        
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
        
        // Day 3 / 1 - 2017-06-07 (Wednesday)
        
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
                                message: "Ok, so today's mission is...",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "to smile",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "to laugh",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "to be happy 🙂",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "yes, that's it!",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "Nothing can bring you down.",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "Not today.",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "because it's an amazing day!",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "(even though I'm still not there!) 😁",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "It's all going to be AWESOME!",
                                timeout: 2))
        
        messages.append(Message(type: .action,
                                message: "right?!",
                                action1: "RIGHT!! 🙂"))
        
        messages.append(Message(type: .message,
                                message: "Awesome!!",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "So go out there, and have an amazing day!",
                                timeout: 3))
        
        messages.append(Message(type: .message,
                                message: "🙂",
                                timeout: 2))
        
        messages.append(Message(type: .action,
                                message: "Oh, and listen to\n`IF TODAY WAS YOUR LAST DAY!!! - NICKLEBACK`.",
                                action1: "Ok!! 😎"))
        
        messages.append(Message(type: .message,
                                message: "✌🏻",
                                timeout: 2))
        
        // Day 3 / 2 - 2017-06-07 (Wednesday)
        
        messages.append(Message(type: .options,
                                message: "Hi! I bet you couldn't wait for this message to come!! ☺️",
                                date: "2017-06-07 17:59",
                                action1: "Not much.",
                                action2: "True! 🙂"))
        
        messages.append(Message(type: .message,
                                message: "Yes! I knew it!!",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "Happy 1 year anniversary in Mindvalley! 😊😊",
                                timeout: 3))
        
        messages.append(Message(type: .message,
                                message: "In a month, will be mine...",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "And as for you, so much has happened...",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "awesome opportunities...",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "awesome experiences...",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "meeting awesome people...",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "meeting you... 😊",
                                timeout: 2))
        
        messages.append(Message(type: .options,
                                message: "Did you have a happy day? 🙂",
                                action1: "Kinda..",
                                action2: "Yes!"))
        
        messages.append(Message(type: .input,
                                message: "What was your favourite moment?",
                                needAnswer: true,
                                timeout:0))
        
        messages.append(Message(type: .message,
                                message: "BTW, you were a really cute baby! ☺️",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "I did look at the picture a few times today...",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "And felt happy every time! 😊",
                                timeout: 2))
        
//        messages.append(Message(type: .message,
//                                message: "some days ago we were talking...",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "about what we want for the future.",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "what you said, is that you just want to be happy. 🙂",
//                                timeout: 3))
//        
//        messages.append(Message(type: .message,
//                                message: "I guess that's what we all want, right?",
//                                timeout: 3))
//        
//        messages.append(Message(type: .message,
//                                message: "You know what makes you happy...",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "And you probably know what can make you happy starting now...",
//                                timeout: 4))
//        
//        messages.append(Message(type: .message,
//                                message: "I told you before...",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "Actually, I never needed to tell you, you already knew it. 😏",
//                                timeout: 3))
//        
//        messages.append(Message(type: .message,
//                                message: "...because of the gift and the curse... 😛",
//                                timeout: 3))
//        
//        messages.append(Message(type: .message,
//                                message: "that I'm stuborn and impatient.",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "just like you... 🙂",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "but perhaps that's not a bad thing...",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "perhaps that's what makes us great.",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "even though it doesn't always work out",
//                                timeout: 2.5))
//        
//        messages.append(Message(type: .message,
//                                message: "at least we tried... 🙂",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "we should not regret about things we did...",
//                                timeout: 2.5))
//        
//        messages.append(Message(type: .message,
//                                message: "but about things we didn't do.",
//                                timeout: 2.5))
//        
//        messages.append(Message(type: .message,
//                                message: "right? 🙂",
//                                timeout: 2))
//        
//        messages.append(Message(type: .message,
//                                message: "so, I'm not saying we have to jump into something fast...",
//                                timeout: 4))
//        
//        messages.append(Message(type: .message,
//                                message: "but I would like to know...",
//                                timeout: 2))
//        
//        messages.append(Message(type: .options,
//                                message: "Is it ok if I ask you out sometime? ☺️",
//                                action1: "Not sure",
//                                action2: "Yes 🙂"))
//        
//        messages.append(Message(type: .message,
//                                message: "Okie dokie! I'll consider it!",
//                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "It's been awesome talking to you today! 🙂",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "Yes, Awesome!",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "Your favourite word! 🙂",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "I wish you an awesome night!",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "have fun at the gym! 😛",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "Tchau! (goodbye in portuguese)",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "🤗",
                                timeout: 2))
        
        //.........
        
        // Day 4 / 1 - 2017-06-08 (Thursday)
        
        messages.append(Message(type: .message,
                                message: "Bom dia!! 🙂",
                                date: "2017-06-08 09:01",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "How are you today?",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "I hope that this week has been good for you. 🙂",
                                timeout:3))
        messages.append(Message(type: .message,
                                message: "And perhaps I had something to do with it… ☺️",
                                timeout:3))
        messages.append(Message(type: .message,
                                message: "These last month has been…",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Crazy…",
                                timeout:1))
        messages.append(Message(type: .message,
                                message: "Confusing…",
                                timeout:1))
        messages.append(Message(type: .message,
                                message: "Sad…",
                                timeout:1))
        messages.append(Message(type: .message,
                                message: "Happy. 😊",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "A lot has happened...",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "But there was one thing I realized every day more.",
                                timeout:3))
        messages.append(Message(type: .message,
                                message: "Which is how I feel about you. ☺️",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "That you know already…",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "But probably you want me to spell it out.",
                                timeout:3))
        messages.append(Message(type: .message,
                                message: "Because “feelings” don’t really make sense.",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Right? ☺️",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "well… ",
                                timeout:1))
        messages.append(Message(type: .message,
                                message: "Actually, I’ll tell you later.",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Don’t want to say it all at once.",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "What is the fun on that? 🙂",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "In the meanwhile…",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "I think you should treat yourself with something nice today…",
                                timeout:4))
        messages.append(Message(type: .message,
                                message: "What about going to work a little bit later… 😊",
                                timeout:3))
        messages.append(Message(type: .message,
                                message: "After 10…",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Because, ISETAN cake place only opens at 10…",
                                timeout:3))
        messages.append(Message(type: .message,
                                message: "And before going to office, hmmm..",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Get something for after lunch 😊",
                                timeout:2))
        messages.append(Message(type: .picture,
                                message: "I’d love to see which one you choose! 🙂",
                                action1: "Take a picture"))
        messages.append(Message(type: .input,
                                message: "Why did you pick this one?",
                                needAnswer: true,
                                timeout:0))
        messages.append(Message(type: .message,
                                message: "Ok, that’s interesting…",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Wish you an amazing day!",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Wish you a классно day! 😊",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "See, educated! 😊",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "😉",
                                timeout:1))
        
        //.........
        
        // Day 4 / 2 - 2017-06-08 (Thursday)
        
        messages.append(Message(type: .message,
                                message: "Hi hi!! ☺️",
                                date: "2017-06-08 13:27",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Sorry, unusual time, I know!",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "I didn’t want to be predictable, so I came earlier!",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "☺️",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "But really fast, I’ll be gone soon, won’t bother you for long! 😊",
                                timeout:4))
        messages.append(Message(type: .message,
                                message: "I was just, here,",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Watching the sun",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "And this blue sky",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "It got boring you know… ☺️",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Yes, it’s your app talking…",
                                timeout:2))
        messages.append(Message(type: .input,
                                message: "Just wanted to know how was lunch. 🙂",
                                needAnswer: true,
                                timeout: 0))
        messages.append(Message(type: .options,
                                message: "Was dessert good?",
                                action1: "No",
                                action2: "Yes 😊"))
        messages.append(Message(type: .options,
                                message: "Ok then!",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Hope you have fun during the rest of the day…",
                                timeout:3))
        messages.append(Message(type: .message,
                                message: "Bye bye 🙂",
                                timeout:2))
        
        //.........
        
        // Day 4 / 3 - 2017-06-08 (Thursday)
        
        messages.append(Message(type: .message,
                                message: "I’m back! 😊",
                                date: "2017-06-08 18:59",
                                timeout:2))
        messages.append(Message(type: .options,
                                message: "Missing me?",
                                action1: "Not much",
                                action2: "yes!!!"))
        messages.append(Message(type: .message,
                                message: "😊",
                                timeout:1))
        messages.append(Message(type: .message,
                                message: "I’m missing you…",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "You did ask me about this app before…",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "I never gave you many details.",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "On how it started, why and when I’m writing it all",
                                timeout:3))
        messages.append(Message(type: .message,
                                message: "Maybe I am writing it live",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Maybe I wrote it so long ago",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Or maybe I developed the app to write in my behalf",
                                timeout:3))
        messages.append(Message(type: .message,
                                message: "So I don’t have to do it",
                                timeout:2))
        messages.append(Message(type: .action,
                                message: "Smart, right? 🤓",
                                action1: "Very!"))
        messages.append(Message(type: .message,
                                message: "Well…",
                                timeout:1))
        messages.append(Message(type: .message,
                                message: "What actually happened was.",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "I had this idea a couple of weeks ago",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "2 weekends before my trip",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "I knew I was going to miss you during this time I was out",
                                timeout:4))
        messages.append(Message(type: .message,
                                message: "And for some reason, ",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "I did feel you were going to miss me too",
                                timeout:2.5))
        messages.append(Message(type: .message,
                                message: "So, my idea was not to build an app",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "But to build an amazing week for you...",
                                timeout:3))
        messages.append(Message(type: .message,
                                message: "While being in the other side of the world",
                                timeout:2.5))
        messages.append(Message(type: .message,
                                message: "😊",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "I hope it’s working…",
                                timeout:2))
        messages.append(Message(type: .options,
                                message: "Is it?",
                                action1: "No",
                                action2: "Yes"))
        messages.append(Message(type: .message,
                                message: "Timing is something interesting…",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Right now, this whole day I’ve been writing from the plane from Taipei to SF.",
                                timeout:4))
        messages.append(Message(type: .message,
                                message: "Talked to you an hour ago over WhatsApp",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Sending you some weird dessert pictures ☺️",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "That I bet you were really interested!",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "🙂",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "I just realized…",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "I’m talking to much today.",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "I’ll continue tomorrow ☺️",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "I wish you a great end of day!",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Keep smiling and being happy.",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "That’s how I’m picturing you right now ☺️",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "🤗",
                                timeout:1))
        
        //.........
        
        // Day 5 / 1 - 2017-06-09 (Friday)
        
        messages.append(Message(type: .message,
                                message: "Howdy!",
                                date: "2017-06-09 09:05",
                                timeout: 2))
        messages.append(Message(type: .options,
                                message: "Did you sleep well? ☺️",
                                action1: "Kinda",
                                action2: "Very"))
        messages.append(Message(type: .message,
                                message: "You look stunning!",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Yes, I can tell.😊",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "And no worry, no picture required 😅",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "...although I did enjoying seeing little Ириночка ☺️",
                                timeout:3))
        messages.append(Message(type: .message,
                                message: "🌹",
                                timeout:1.5))
        messages.append(Message(type: .message,
                                message: "Hope this is bringing more joy to your days… 😊",
                                timeout:3))
        messages.append(Message(type: .message,
                                message: "I’m glad if it is!",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Knowing that you are happy, do make me happy. 😊",
                                timeout:3))
        messages.append(Message(type: .options,
                                message: "Are you happy?",
                                action1: "Not yet",
                                action2: "да!"))
        messages.append(Message(type: .message,
                                message: "☺️",
                                timeout:1))
        messages.append(Message(type: .input,
                                message: "How are you feeling?",
                                needAnswer: true,
                                timeout:0))
        messages.append(Message(type: .message,
                                message: "I want to wish you a beautiful day!",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "And tell you I’ll be thinking about you.",
                                timeout:2.5))
        messages.append(Message(type: .message,
                                message: "Whenever you feel bad, stressed, bored",
                                timeout:2.5))
        messages.append(Message(type: .message,
                                message: "You can remember me telling you something funny",
                                timeout:3))
        messages.append(Message(type: .message,
                                message: "You probably have a few good ones… ☺️",
                                timeout:2))
        
        //.........
        
        // Day 5 / 2 - 2017-06-09 (Friday)
        
        messages.append(Message(type: .message,
                                message: "You must be wondering the whole week",
                                date: "2017-06-09 18:33",
                                timeout: 3))
        messages.append(Message(type: .message,
                                message: "Why this app?",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Why now?",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Maybe there was a better time for it",
                                timeout:2.5))
        messages.append(Message(type: .message,
                                message: "With everything that’s been going on...",
                                timeout:2.5))
        messages.append(Message(type: .message,
                                message: "But I felt like this should be the time",
                                timeout:2.5))
        messages.append(Message(type: .message,
                                message: "And I told you before",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "I’m usually right",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Just like you 😊",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Right?",
                                timeout:1))
        messages.append(Message(type: .message,
                                message: "I have things to tell you…",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "And I’ll do it today, but later, because right now you are probably still in the office...",
                                timeout:4))
        messages.append(Message(type: .message,
                                message: "Or just left…",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "I'll buzz you a bit later. 😊",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Have a great time until then 😉",
                                timeout:2))
        
        //.........
        
        // Day 5 / 2 - 2017-06-09 (Friday)
        
        messages.append(Message(type: .message,
                                message: "Right now, I’m still in the airplane going to SF…",
                                date: "2017-06-09 21:58",
                                timeout:3))
        messages.append(Message(type: .message,
                                message: "But for you, it’s already been a whole week",
                                timeout:3))
        messages.append(Message(type: .message,
                                message: "Since we said goodbye in front of your building...",
                                timeout:3))
        messages.append(Message(type: .message,
                                message: "However for me, it’s only been yesterday.",
                                timeout:2.5))
        messages.append(Message(type: .message,
                                message: "(Yes, I’m traveling through time… and you don’t believe on it yet? 😊)",
                                timeout:4))
        messages.append(Message(type: .message,
                                message: "After you told me you would miss me",
                                timeout:2.5))
        messages.append(Message(type: .message,
                                message: "I wanted to be strong",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "So I never said anything",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "But I was feeling the same",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "I walked away",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "And looked back a few times",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "And I saw you there",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "You stood there for a while",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "I read you and understood.",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "I wanted to go back",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "And hug you again",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "I still don’t know why I didn’t",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "But maybe wasn’t the time",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "I wanted for this week to happen before",
                                timeout:2.5))
        messages.append(Message(type: .message,
                                message: "I wanted you to see",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "…how much you mean to me.",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "I started talking about it yesterday.",
                                timeout:2.5))
        messages.append(Message(type: .message,
                                message: "But never completed…",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Got distracted with other stuff…",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Sorry, I always have so much to tell…",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Last time we went to Din Tai Fung, you told me I keep on asking personal questions…",
                                timeout:4))
        messages.append(Message(type: .message,
                                message: "That you don’t usually talk about even with friends that you have had for years",
                                timeout:4))
        messages.append(Message(type: .message,
                                message: "Truth is that I’m interested in knowing everything about you. 😊",
                                timeout:4))
        messages.append(Message(type: .message,
                                message: "Because time doesn’t mean anything to me.",
                                timeout:2.5))
        messages.append(Message(type: .message,
                                message: "It’s like I know you for a long time…",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Not sure how to explain it…",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "As I told you before…",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "First time I talked you, ",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "I did see something special about you",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "I was sure after we got closer…",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "And I realized that",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "I don’t just like you...",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "I’m in love with you. ",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "I’ve been for a while ☺️",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Not sure exactly when it started",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "But it’s been growing every day more",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "For a lot of reasons",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "That I can explain",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "And cannot",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "I can probably list them all",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Perhaps I will some day…",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "But for today, that’s what I wanted you to know. ",
                                timeout:3))
        messages.append(Message(type: .message,
                                message: "I fought against it for a while,",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "But then I realized there was no point…",
                                timeout:2))
        messages.append(Message(type: .action,
                                message: "Listen to “Trying not to love you” - Nickleback",
                                action1: "Ok"))
        messages.append(Message(type: .message,
                                message: "Sorry, I keep bringing the same band, but you said you liked it, so I used this one :)",
                                timeout:4))
        messages.append(Message(type: .message,
                                message: "I’m going to leave with this for today.",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Good night!",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Sleep wel!! 😊",
                                timeout:2))
        
        //.........
        
        // Day 6 / 1 - 2017-06-10 (Saturday)
        
        messages.append(Message(type: .message,
                                message: "Hi, hi! Good morning!! 🙂",
                                date: "2017-06-10 09:02",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "Добруе утро!! 😊",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Как поживаете? (Очин хорошо!)",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Russian was always intriguing for me…",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "I guess I told you this story already",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "But I’ll tell again anyways 😊",
                                timeout:2))
        messages.append(Message(type: .action,
                                message: "Can?",
                                action1: "I have no other option… 😊"))
        messages.append(Message(type: .message,
                                message: "I first started learning it in 2010",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Just because",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Because the language was intriguing and different",
                                timeout:2.5))
        messages.append(Message(type: .message,
                                message: "Because I didn’t know anybody that could speak it",
                                timeout:2.5))
        messages.append(Message(type: .message,
                                message: "Because I wanted to go to Russia one day 😊",
                                timeout:2.5))
        messages.append(Message(type: .message,
                                message: "I believe experience changes when we can speak the language",
                                timeout:3))
        messages.append(Message(type: .message,
                                message: "That’s one of the reasons I tried a few languages…",
                                timeout:2.5))
        messages.append(Message(type: .message,
                                message: "So I studied it for around 3 months",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Stopped it the first time I travelled without a date to come back, for 5 months",
                                timeout:4))
        messages.append(Message(type: .message,
                                message: "Russia was in my wish list",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "I heard so many awesome things about the place before",
                                timeout:2.5))
        messages.append(Message(type: .message,
                                message: "(Opposite to what I joke about 😛)",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Had to see for myself...",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "And before coming back home, I wondered whether I should go there from China or not",
                                timeout:4))
        messages.append(Message(type: .message,
                                message: "But ended up not going, for some reason (I guess money was over… 😊)",
                                timeout:4))
        messages.append(Message(type: .message,
                                message: "During the trip, I got to practice 2 sentences with a Russian girl I met in Vietnam",
                                timeout:4))
        messages.append(Message(type: .message,
                                message: "I was happy I still remembered something…😊",
                                timeout:2))
        messages.append(Message(type: .options,
                                message: "Should I continue?",
                                action1: "I’m bored.",
                                action2: "Yes, it’s interesting…"))
        messages.append(Message(type: .message,
                                message: "Ok… anyways, the app doesn’t support different options yet… 😊",
                                timeout:3.5))
        messages.append(Message(type: .message,
                                message: "So you will have to keep with my story 😊",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "By the time I finally got the chance to go to Russia,",
                                timeout:2.5))
        messages.append(Message(type: .message,
                                message: "In 2014",
                                timeout:1))
        messages.append(Message(type: .message,
                                message: "I didn’t practice anymore before…",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "So I had to keep remembering words and sentences…",
                                timeout:3))
        messages.append(Message(type: .message,
                                message: "And even though я говорию нимниога поруски",
                                timeout:2.5))
        messages.append(Message(type: .message,
                                message: "I had an amazing experience",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Ok, not with food 😊",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "That’s because you weren’t there to show me the places…",
                                timeout:3))
        messages.append(Message(type: .message,
                                message: "Your fault! 😊",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "So,",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "I’m not only learning the language to impress you",
                                timeout:2.5))
        messages.append(Message(type: .message,
                                message: "Maybe that too, a bit… 😊",
                                timeout:2))
        messages.append(Message(type: .action,
                                message: "Is it working?",
                                action1: "No",
                                action2: "Yes"))
        messages.append(Message(type: .message,
                                message: "But also because it intrigues me",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "So you may not have realized ",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Or I think you did already…",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "You are not the only one learning something from me",
                                timeout:3))
        messages.append(Message(type: .message,
                                message: "With the iOS classes",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "But I’m learning a lot from you",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "About a lot of things",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Food",
                                timeout:1))
        messages.append(Message(type: .message,
                                message: "Life",
                                timeout:1))
        messages.append(Message(type: .message,
                                message: "Music",
                                timeout:1))
        messages.append(Message(type: .message,
                                message: "Culture",
                                timeout:1))
        messages.append(Message(type: .message,
                                message: "…",
                                timeout:1))
        messages.append(Message(type: .message,
                                message: "But also your language.",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Thank you! 😊",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Ok, story was too long.",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "So sorry, I tried to keep it short…",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "But you see, it’s too much too tell 😊",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Хорошие выходные!!",
                                timeout:2))
        
        //.........
        
        // Day 7 / 1 - 2017-06-11 (Sunday)
        
        messages.append(Message(type: .message,
                                message: "Hello again!! 🙂",
                                date: "2017-06-11 09:00",
                                timeout: 2))
        
        messages.append(Message(type: .message,
                                message: "Good morning!",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "It’s always awesome to see you! 😊",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Классно!",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "The other day I started talking about the app..",
                                timeout:3))
        messages.append(Message(type: .message,
                                message: "But again, never finished 😊",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "So much information!!",
                                timeout:2))
        messages.append(Message(type: .action,
                                message: "I’ll tell you more about it… let me know once you are ready 😊",
                                action1: "I'm ready"))
        messages.append(Message(type: .message,
                                message: "I guess we all have to use our own tools / knowledge / abilities / powers / magic to express ourselves, right?",
                                timeout:4))
        messages.append(Message(type: .message,
                                message: "Maybe this is as you said…",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "This is what developers do. 😊",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "This is the way I chose to express myself",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Building you this app",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Which has nothing random",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Not even the name…",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "And this one you probably figured out where it came from already…",
                                timeout:3.5))
        messages.append(Message(type: .message,
                                message: "So I won’t say it 😊",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "The code itself is quite interesting though",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "It even has a backend 😊",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "And GitHub versioning.",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "I’ll show you sometime…",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "If you are interested of course. 😊",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "There is so much more I wanted to do with it",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "To express everything I wanted to",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "But there was only this little I could do during this time. 😊",
                                timeout:3))
        messages.append(Message(type: .message,
                                message: "I’ve been writing the messages along development...",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Wanted to plan so much more,",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "But some of the plans in short notice didn’t work out…",
                                timeout:3))
        messages.append(Message(type: .message,
                                message: "Perhaps I’ll do them moving forward… 😊",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "For now, I wish you an awesome Sunday!",
                                timeout:2))
        messages.append(Message(type: .message,
                                message: "Hope you enjoy your day! 😊",
                                timeout:2))
        
        //easy like sunday morning
        
        //.........
        
        // Day 8 / 1 - 2017-06-12 (Monday)
        
        messages.append(Message(type: .message,
                                message: "",
                                date: "2017-06-12 09:01",
                                timeout: 2))
        
        //.........
        
        // Day 8 / 2 - 2017-06-12 (Monday)
        
        messages.append(Message(type: .message,
                                message: "",
                                date: "2017-06-12 18:03",
                                timeout: 2))
        
        //.........
        
        // Day 9 / 1 - 2017-06-13 (Tuesday)
        
        messages.append(Message(type: .message,
                                message: "",
                                date: "2017-06-13 09:01",
                                timeout: 2))
        
        //.........
        
        // Day 9 / 2 - 2017-06-13 (Tuesday)
        
        messages.append(Message(type: .message,
                                message: "",
                                date: "2017-06-13 18:03",
                                timeout: 2))
        
        //.........
        
        // Day 10 / 1 - 2017-06-14 (Wednesday)
        
        messages.append(Message(type: .message,
                                message: "",
                                date: "2017-06-14 09:01",
                                timeout: 2))
        
        //.........
        
        // Day 10 / 2 - 2017-06-14 (Tuesday)
        
        messages.append(Message(type: .message,
                                message: "",
                                date: "2017-06-14 18:03",
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
