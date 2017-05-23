//
//  MessageLabel.swift
//  PS
//
//  Created by Evandro Harrison Hoffmann on 5/22/17.
//  Copyright © 2017 It's Day Off. All rights reserved.
//

import UIKit

let readDuration: Double = 2
let inDuration: Double = 0.5
let outDuration: Double = 0.5

class MessageView: UIView {
    
    @IBOutlet weak var messageLabel: UILabel!
    
    var shownCallback: (()->Void)?
    var hiddenCallback: (()->Void)?
    var message: Message?
    
    static func newInstance(type: FirebaseKeyType) -> MessageView{
        return Bundle(for: self).loadNibNamed("MessageView", owner: self, options: nil)![0] as! MessageView
    }
    
    override func awakeFromNib() {
        self.isHidden = true
    }
}

//MARK: - Animations

extension MessageView {
    
    func show(autoHide: Bool) {
        self.messageLabel.text = message?.message
        
        self.frame.origin.y = superview?.frame.size.height ?? UIScreen.main.bounds.size.height
        self.isHidden = false
        self.alpha = 0
        
        UIView.animate(withDuration: outDuration, delay: 0, options: .curveEaseOut, animations: {
            self.alpha = 1
            self.frame.origin.y = 0
        }) { (completed) in
            if autoHide {
                Timer.scheduledTimer(timeInterval: readDuration, target: self, selector: #selector(MessageView.hideAfterDelay(_:)), userInfo: nil, repeats: false)
            }
            
            self.shownCallback?()
        }
    }
    
    func hide() {
        UIView.animate(withDuration: outDuration, delay: 0, options: .curveEaseIn, animations: {
            self.alpha = 0
            self.frame.origin.y = -self.frame.size.height
        }) { (completed) in
            self.hiddenCallback?()
        }
    }
    
    @IBAction func hideAfterDelay(_ timer: Timer) {
        hide()
    }
}

extension UIView {
    
    func startLoadingAnimationDelayed(_ delay: Double, message: Message, autoHide: Bool = true, shown: (()->Void)? = nil, hidden: (()->Void)? = nil){
        let delayTime = DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            self.showMessageView(message: message, autoHide: autoHide, shown: shown, hidden: hidden)
        }
    }
    
    func showMessageView(message: Message, autoHide: Bool = true, shown: (()->Void)? = nil, hidden: (()->Void)? = nil){
        //hideMessageView()
        
        let messageView = MessageView.newInstance(type: message.type)
        messageView.shownCallback = shown
        messageView.hiddenCallback = hidden
        messageView.message = message
        messageView.frame = self.bounds
        self.addSubview(messageView)
        messageView.show(autoHide: autoHide)
    }
    
    func hideMessageView(){
        for subview in subviews{
            if let subview = subview as? MessageView {
                subview.hide()
            }
        }
    }
}
