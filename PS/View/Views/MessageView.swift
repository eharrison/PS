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
let playNotification = Notification.Name(rawValue: "playNotification")
let pauseNotification = Notification.Name(rawValue: "pauseNotification")

class MessageView: MVImagePickerView {
    
    @IBOutlet weak var messageLabel: UILabel?
    @IBOutlet weak var messageDetailLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField?
    @IBOutlet weak var option1Button: UIButton?
    @IBOutlet weak var option2Button: UIButton?
    
    var playing: Bool = false
    var shownCallback: (()->Void)?
    var hiddenCallback: (()->Void)?
    var actionCallback: (()->Void)?
    var message: Message?
    var countdownDate: Date?
    var countdownTimer: Timer?
    var timeoutTimer: Timer?
    var countdownFinishedCallback: (()->Void)?
    
    var timeout: Double {
        return self.message?.timeout ?? 0
    }
    
    static func newInstance(type: FirebaseKeyType, isCountdown: Bool) -> MessageView?{
        var index = 0
        
        //if is countdown, show countdown
        if isCountdown {
            return Bundle(for: self).loadNibNamed("MessageView", owner: self, options: nil)![index] as? MessageView
        }
        
        switch type {
        case .message:
            index = 1
            break
        case .input:
            index = 2
            break
        case .action:
            index = 3
            break
        case .picture:
            index = 3
            break
        case .enablePush:
            index = 3
            break
        case .options:
            index = 4
            break
        }
        
        return Bundle(for: self).loadNibNamed("MessageView", owner: self, options: nil)![index] as? MessageView
    }
    
    override func awakeFromNib() {
        self.isHidden = true
        
        //NotificationCenter.default.addObserver(self, selector: #selector(MessageView.pause), name: playNotification, object: nil)
        //NotificationCenter.default.addObserver(self, selector: #selector(MessageView.play), name: pauseNotification, object: nil)
    }
}

//MARK: - Animations

extension MessageView {
    
    func pause() {
        playing = false
        
        self.timeoutTimer?.invalidate()
    }
    
    func play() {
        playing = true
        
        if self.timeout > 0 {
            self.timeoutTimer = Timer.scheduledTimer(timeInterval: self.timeout, target: self, selector: #selector(MessageView.hideAfterDelay(_:)), userInfo: nil, repeats: false)
        }
    }
    
    func show() {
        self.messageLabel?.text = message?.message
        
        self.inputTextField?.placeholder = message?.message
        self.inputTextField?.becomeFirstResponder()
        self.inputTextField?.returnKeyType = .send
        self.inputTextField?.delegate = self
        
        self.option1Button?.setTitle(message?.action1, for: .normal)
        self.option2Button?.setTitle(message?.action2, for: .normal)
        
        self.startCountdown()
        
        //----------
        
        //self.frame.origin.y = superview?.frame.size.height ?? UIScreen.main.bounds.size.height
        self.isHidden = false
        self.alpha = 0
        
        UIView.animate(withDuration: outDuration, delay: 0, options: .curveEaseOut, animations: {
            self.alpha = 1
            //self.frame.origin.y = 0
        }) { (completed) in
            if self.timeout > 0 {
                self.timeoutTimer = Timer.scheduledTimer(timeInterval: self.timeout, target: self, selector: #selector(MessageView.hideAfterDelay(_:)), userInfo: nil, repeats: false)
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
        
        self.message?.read = true
        self.message?.readAt = Date().toString(format: "yyyy-MM-dd HH:mm")
        self.message?.answer = textField.text
        if let message = message {
            FirebaseHelper.save(message: message)
        }
        
        inputTextField?.resignFirstResponder()
        hide()
        
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
            } else if self.message?.type == .picture {
                self.createAndShowActionSheetToPickImage()
            } else {
                self.message?.read = true
                self.message?.readAt = Date().toString(format: "yyyy-MM-dd HH:mm")
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
            self.message?.read = true
            self.message?.readAt = Date().toString(format: "yyyy-MM-dd HH:mm")
            self.message?.answer = self.message?.action2
            if let message = self.message {
                FirebaseHelper.save(message: message)
            }
            
            self.hide()
        })
    }
}

// MARK:- ImagePickerDelegate

extension MessageView {
    override func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        super.imagePickerController(picker, didFinishPickingImage: image, editingInfo: editingInfo)
        
        // do something with the image
        FirebaseHelper.upload(loadingView: self, image: image) { (imageUrl) in
            self.message?.imageUrl = imageUrl
            self.message?.read = true
            self.message?.readAt = Date().toString(format: "yyyy-MM-dd HH:mm")
            if let message = self.message {
                FirebaseHelper.save(message: message)
            }
            
            self.hide()
        }
    }
}

// MARK: - Countdown

extension MessageView {
    
    func startCountdown(){
        guard countdownDate != nil else{
            return
        }
        
        updateCounter()
        
        countdownTimer?.invalidate()
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(MessageView.updateCounter), userInfo: nil, repeats: true)
    }
    
    func updateCounter(){
        guard let date = countdownDate else{
            messageDetailLabel.text = "00d 00h 00m 00s"
            
            countdownTimer?.invalidate()
            countdownFinishedCallback?()
            return
        }
        
        let timeLeft = date.timeIntervalSinceNow
        
        messageDetailLabel.text = "\(timeLeft.days)d \(timeLeft.hours)h \(timeLeft.minutes)m \(timeLeft.seconds)s"

        if timeLeft <= 0.0 {
            countdownTimer?.invalidate()
            countdownFinishedCallback?()
        }
    }
    
    func removeLeadingZeros(_ value: String) -> String {
        var string = value
        if string.characters.count > 1 && string.hasPrefix("0") {
            string.remove(at: string.startIndex)
        }
        return string
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
    
    func showMessageView(message: Message, countdownTo: Date? = nil, shown: (()->Void)? = nil, hidden: (()->Void)? = nil, action: (()->Void)? = nil, countdownFinished: (()->Void)? = nil){
        //hideMessageView()
        
        if let messageView = MessageView.newInstance(type: message.type, isCountdown: countdownTo != nil) {
            messageView.shownCallback = shown
            messageView.hiddenCallback = hidden
            messageView.countdownFinishedCallback = countdownFinished
            messageView.message = message
            messageView.countdownDate = countdownTo
            messageView.actionCallback = action
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
