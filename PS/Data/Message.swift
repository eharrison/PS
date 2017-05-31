//
//  Message.swift
//  PS
//
//  Created by Evandro Harrison Hoffmann on 5/23/17.
//  Copyright © 2017 It's Day Off. All rights reserved.
//

import Foundation

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
    var imageUrl: String?
    
    var canShow: Bool {
//        #if Editor
//            return true
//        #endif
        
        guard let date = date?.toDate(format: "yyyy-MM-dd HH:mm") else {
            return true
        }
        
        return Date() >= date
    }
    
    init(id: String? = nil, type: FirebaseKeyType = .message, message: String? = nil, action: FirebaseKeyAction = .none, imageUrl: String? = nil, date: String? = nil, read: Bool = false, readAt: String? = nil, answer: String? = nil, needAnswer: Bool = false, timeout: Double = 0, waitTime: Double = 0, action1: String? = nil, action2: String? = nil) {
        self.id = id
        self.message = message
        self.type = type
        self.action = action
        self.imageUrl = imageUrl
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
