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
            messages.removeFirst()
            
            if message.canShow {
                self.contentView.showMessageView(message: message, shown:{
                    
                }, hidden:{
                    self.nextMessage()
                })
            }else{
                self.nextMessage()
            }
        }
        
    }

}
