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
    
    var messages = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        FirebaseHelper.messages({ (messages) in
            self.messages = messages
            self.nextMessage()
        })
    }
    
    // MARK: - Animations
    
    private func nextMessage() {
        if let text = messages.first?.message {
            messages.removeFirst()
            
            self.contentView.showMessageView(message: text, shown:{
                
            }, hidden:{
                self.nextMessage()
            })
        }
        
    }

}
