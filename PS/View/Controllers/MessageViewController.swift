//
//  MessageViewController.swift
//  PS
//
//  Created by Evandro Harrison Hoffmann on 5/22/17.
//  Copyright © 2017 It's Day Off. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    @IBOutlet weak var topGradientView: DesignableView!
    @IBOutlet weak var bottomGradientView: DesignableView!
    @IBOutlet weak var contentView: UIView!
    
    var startedAnimation = false
    var messages = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        FirebaseHelper.messages({ (messages) in
            if !self.startedAnimation {
                self.messages = messages
                self.nextMessage()
                self.startedAnimation = true
            }
        })
    }
    
    // MARK: - Animations
    
    private func nextMessage() {
        if let message = messages.first {
            if message.canShow {
                messages.removeFirst()
                
                //date has arrived
                if message.read {
                    //already read, go to next message
                    self.nextMessage()
                }else{
                    self.contentView.showMessageView(message: message, shown:{
                        
                    }, hidden:{
                        self.nextMessage()
                    })
                }
            }else{
                //not time for message yet
                self.contentView.showMessageView(message: Message(type: .message, message: "Be patient! 😊\n\nNext message will come in:"), countdownTo: message.date?.toDate(format: "yyyy-MM-dd HH:mm"), shown:{
                    
                }, hidden:{
                    
                }, countdownFinished: {
                    self.contentView.hideMessageView()
                    self.nextMessage()
                })
            }
        }
    }
}
