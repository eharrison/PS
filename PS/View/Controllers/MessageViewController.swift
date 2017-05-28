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
    @IBOutlet weak var historyButton: UIButton!
    
    var startedAnimation = false
    var messages = [Message]()
    var lastHour: Double = 0
    var sceneTimer: Timer?
    var dayTime = DayTime.none
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(MessageViewController.refreshContent), name: playNotification, object: nil)
        
        //update scene timer
        sceneTimer?.invalidate()
        sceneTimer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(MessageViewController.refreshScene), userInfo: nil, repeats: true)

        refreshContent()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func refreshContent(){
        startedAnimation = false
        
        self.contentView.hideMessageView()
        
        FirebaseHelper.messages({ (messages) in
            if !self.startedAnimation {
                self.messages = messages
                self.nextMessage()
                self.startedAnimation = true
                
                MVNotificationsHelper.setupNotifications(withMessages: messages)
            }
        })
        
        refreshScene()
    }
    
    // MARK: - Navigation
    
    @IBAction func unwindToMessage(_ segue: UIStoryboardSegue){
        
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
        } else {
            //no more messages
            self.contentView.showMessageView(message: Message(type: .message, message: "Oh no! I don't have any more messages to show...\nMaybe they'll come back.\nBe tuned! 🙂"), shown:{
                
            }, hidden:{
                
            })
        }
    }
}

// MARK: -  Scene

enum DayTime {
    case none
    case day
    case night
}

extension MessageViewController {
    
    func refreshScene() {
        //Current time
        let hour = Int(Date().toString(format: "HH")) ?? 8
        let minutes = Int(Date().toString(format: "mm")) ?? 0
        let time = Double(hour) + Double(minutes/60)
        
        guard lastHour != Double(hour) else {
            return
        }
        
        lastHour = Double(hour)
        
        //testing
        /*
        let time = lastHour+1
        lastHour = time
        if lastHour > 23 {
            lastHour = 0
        }
        print(time)*/
        
        //change background color based on time
        let colorWithTime = UIColor.color(withHour: time)
        UIView.animate(withDuration: 0.3) {
            self.view.backgroundColor = colorWithTime
            self.topGradientView.gradientTopColor = colorWithTime
            self.topGradientView.gradientBottomColor = colorWithTime.withAlphaComponent(0)
            self.bottomGradientView.gradientTopColor = colorWithTime.withAlphaComponent(0)
            self.bottomGradientView.gradientBottomColor = colorWithTime
        }
        
        // adds components based on time
        if time >= 6 && time <= 18 {
            if dayTime != .day {
                self.contentView.hideMoon()
                self.contentView.hideStar()
                
                self.contentView.showSun()
            }
            
            dayTime = .day
        } else {
            if dayTime != .night {
                self.contentView.hideSun()
                
                self.contentView.showStars(count: 20)
                self.contentView.showMoon()
            }
            
            dayTime = .night
        }
    }
    
}
