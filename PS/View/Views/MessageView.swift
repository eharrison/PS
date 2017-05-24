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
    
    @IBOutlet weak var messageLabel: UILabel?
    @IBOutlet weak var inputTextField: UITextField?
    @IBOutlet weak var option1Button: UIButton?
    @IBOutlet weak var option2Button: UIButton?
    
    var shownCallback: (()->Void)?
    var hiddenCallback: (()->Void)?
    var message: Message?
    
    var timeout: Double {
        return self.message?.timeout ?? 0
    }
    
    static func newInstance(type: FirebaseKeyType) -> MessageView?{
        var index = 0
        
        switch type {
        case .message:
            index = 0
            break
        case .input:
            index = 1
            break
        case .action:
            index = 2
            break
        case .enablePush:
            index = 2
            break
        case .options:
            index = 3
            break
        }
        
        return Bundle(for: self).loadNibNamed("MessageView", owner: self, options: nil)![index] as? MessageView
    }
    
    override func awakeFromNib() {
        self.isHidden = true
    }
}

//MARK: - Animations

extension MessageView {
    
    func show() {
        self.messageLabel?.text = message?.message
        
        self.inputTextField?.placeholder = message?.message
        self.inputTextField?.becomeFirstResponder()
        
        self.option1Button?.setTitle(message?.action1, for: .normal)
        self.option2Button?.setTitle(message?.action2, for: .normal)
        
        //----------
        
        self.frame.origin.y = superview?.frame.size.height ?? UIScreen.main.bounds.size.height
        self.isHidden = false
        self.alpha = 0
        
        UIView.animate(withDuration: outDuration, delay: 0, options: .curveEaseOut, animations: {
            self.alpha = 1
            self.frame.origin.y = 0
        }) { (completed) in
            if self.timeout > 0 {
                Timer.scheduledTimer(timeInterval: self.timeout, target: self, selector: #selector(MessageView.hideAfterDelay(_:)), userInfo: nil, repeats: false)
            }
            
            self.shownCallback?()
            self.updateMessageRead()
            self.successNotificationFeedback()
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
        inputTextField?.resignFirstResponder()
        
        hide()
    }
}

// MARK: - Database

extension MessageView {
    
    func updateMessageRead(){
        guard var message = message else {
            return
        }
        
        message.read = true
        message.readAt = Date().toString(format: "yyyy-MM-dd HH:mm")
        FirebaseHelper.save(message: message)
    }
}

// MARK: - TextField Delegate

extension MessageView: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard message?.needAnswer ?? false else {
            return false
        }
        
        self.message?.answer = textField.text
        if let message = message {
            FirebaseHelper.save(message: message)
        }
        
        inputTextField?.resignFirstResponder()
        
        return false
    }
    
}

// MARK: - Option Actions

extension MessageView {
    
    @IBAction func option1Pressed(_ sender: UIButton) {
        sender.selectionFeedback()
        sender.animateTouchDown(halfWay: {
            if self.message?.type == .enablePush {
                AppDelegate.current?.window?.rootViewController?.showEnableNotificationsRequest({
                    DispatchQueue.main.async {
                        self.hide()
                    }
                })
            }else {
                self.message?.answer = self.message?.action1
                if let message = self.message {
                    FirebaseHelper.save(message: message)
                }
                
                self.hide()
            }
        })
    }
    
    @IBAction func option2Pressed(_ sender: UIButton) {
        sender.selectionFeedback()
        sender.animateTouchDown(halfWay: {
            self.message?.answer = self.message?.action2
            if let message = self.message {
                FirebaseHelper.save(message: message)
            }
            
            self.hide()
        })
    }
}

// MARK: - UIView Extensions

extension UIView {
    
    func startLoadingAnimationDelayed(_ delay: Double, message: Message, shown: (()->Void)? = nil, hidden: (()->Void)? = nil){
        let delayTime = DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            self.showMessageView(message: message, shown: shown, hidden: hidden)
        }
    }
    
    func showMessageView(message: Message, shown: (()->Void)? = nil, hidden: (()->Void)? = nil){
        //hideMessageView()
        
        if let messageView = MessageView.newInstance(type: message.type) {
            messageView.shownCallback = shown
            messageView.hiddenCallback = hidden
            messageView.message = message
            messageView.frame = self.bounds
            self.addSubview(messageView)
            messageView.show()
        }
    }
    
    func hideMessageView(){
        for subview in subviews{
            if let subview = subview as? MessageView {
                subview.hide()
            }
        }
    }
}
