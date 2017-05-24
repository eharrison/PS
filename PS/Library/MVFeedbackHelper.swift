//
//  MVFeedbackHelper.swift
//  Quests
//
//  Created by Evandro Harrison Hoffmann on 5/14/17.
//  Copyright © 2017 Mindvalley. All rights reserved.
//

import UIKit

struct MVFeedbackHelper {
    
    // MARK: - facilitators
    
    static func lightImpact(){
        generateImpact(style: .light)
    }
    
    static func mediumImpact(){
        generateImpact(style: .medium)
    }
    
    static func heavyImpact(){
        generateImpact(style: .heavy)
    }
    
    static func selection(){
        generateSelection()
    }
    
    static func successNotificaiton(){
        generateNotification(type: .success)
    }
    
    static func errorNotificaiton(){
        generateNotification(type: .error)
    }
    
    static func warningNotificaiton(){
        generateNotification(type: .warning)
    }
    
    // MARK: - Generic calls
    
    static func generateImpact(style: UIImpactFeedbackStyle){
        guard #available(iOS 10.0, *) else {
            return
        }
        
        let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: style)
        lightImpactFeedbackGenerator.impactOccurred()
    }
    
    static func generateSelection(){
        guard #available(iOS 10.0, *) else {
            return
        }
        
        let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
        selectionFeedbackGenerator.selectionChanged()
    }
    
    static func generateNotification(type: UINotificationFeedbackType){
        guard #available(iOS 10.0, *) else {
            return
        }
        
        let successNotificationFeedbackGenerator = UINotificationFeedbackGenerator()
        successNotificationFeedbackGenerator.notificationOccurred(type)
    }
    
}

// MARK: - UIViewController

extension UIViewController {
    
    func lightImpactFeedback(){
        MVFeedbackHelper.lightImpact()
    }
    
    func mediumImpactFeedback(){
        MVFeedbackHelper.mediumImpact()
    }
    
    func heavyImpactFeedback(){
        MVFeedbackHelper.heavyImpact()
    }
    
    func selectionFeedback(){
        MVFeedbackHelper.selection()
    }
    
    func successNotificationFeedback(){
        MVFeedbackHelper.successNotificaiton()
    }
    
    func errorNotificaitonFeedback(){
        MVFeedbackHelper.errorNotificaiton()
    }
    
    func warningNotificaitonFeedback(){
        MVFeedbackHelper.warningNotificaiton()
    }
    
}

// MARK: - UIView

extension UIView {
    
    func lightImpactFeedback(){
        MVFeedbackHelper.lightImpact()
    }
    
    func mediumImpactFeedback(){
        MVFeedbackHelper.mediumImpact()
    }
    
    func heavyImpactFeedback(){
        MVFeedbackHelper.heavyImpact()
    }
    
    func selectionFeedback(){
        MVFeedbackHelper.selection()
    }
    
    func successNotificationFeedback(){
        MVFeedbackHelper.successNotificaiton()
    }
    
    func errorNotificaitonFeedback(){
        MVFeedbackHelper.errorNotificaiton()
    }
    
    func warningNotificaitonFeedback(){
        MVFeedbackHelper.warningNotificaiton()
    }
    
}
