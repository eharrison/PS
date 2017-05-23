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
        if var message = messages.first {
            messages.removeFirst()
            
            //doesn't show if it's already read
            guard !message.read else{
                print("Message '\(message.message ?? "")' read at \(message.readAt ?? "")")
                
                self.nextMessage()
                return
            }
            
            self.contentView.showMessageView(message: message, shown:{
                message.read = true
                message.readAt = Date().toString(format: "yyyy-MM-dd HH:mm")
                FirebaseHelper.save(message: message)
            }, hidden:{
                self.nextMessage()
            })
        }
        
    }

}
