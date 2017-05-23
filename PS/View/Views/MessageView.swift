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
    
    var shownCallback: (()->Void)?
    var hiddenCallback: (()->Void)?
    var message: Message?
    
    var timeout: Double {
        return self.message?.timeout ?? 0
    }
    
    static func newInstance(type: FirebaseKeyType) -> MessageView?{
        switch type {
        case .message:
            return Bundle(for: self).loadNibNamed("MessageView", owner: self, options: nil)![0] as? MessageView
        case .input:
            return Bundle(for: self).loadNibNamed("MessageView", owner: self, options: nil)![1] as? MessageView
        default:
            return nil
        }
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
        
        message?.answer = textField.text
        
        inputTextField?.resignFirstResponder()
        
        return false
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
