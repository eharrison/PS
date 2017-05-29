//
//  Sun.swift
//  PS
//
//  Created by Evandro Harrison Hoffmann on 5/28/17.
//  Copyright © 2017 It's Day Off. All rights reserved.
//

import UIKit

class Sun: SceneComponent {
    
    static func newSun() -> Sun?{
        return Bundle(for: self).loadNibNamed("Sun", owner: self, options: nil)![0] as? Sun
    }
    
    // MARK: - Animations
    
    override func show() {
        let superviewFrame = self.superview?.frame ?? CGRect()
        
        self.isHidden = false
        self.center = CGPoint(x: superviewFrame.size.width+self.frame.size.width/2, y: superviewFrame.size.height/2)
        
        UIView.animate(withDuration: animationTime, delay: 0, options: .curveEaseOut, animations: {
            self.alpha = 1
            self.center = CGPoint(x: superviewFrame.size.width/2, y: self.frame.size.height)
        }) { (completed) in
            self.pulse()
            self.pulseTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(Sun.pulse), userInfo: nil, repeats: true)
        }
    }
    
    override func hide() {
        UIView.animate(withDuration: animationTime, delay: 0, options: .curveEaseOut, animations: {
            self.alpha = 0
            self.center = CGPoint(x: -self.frame.size.width, y: self.frame.size.height)
        }) { (completed) in
            self.removeFromSuperview()
        }
    }
    
}

// MARK: - UIView Extensions

extension UIView {
    
    func showSun(){
        hideSun()
        
        if let sun = Sun.newSun() {
            self.addSubview(sun)
            sun.show()
        }
    }
    
    func hideSun(){
        for subview in subviews{
            if let subview = subview as? Sun {
                subview.hide()
            }
        }
    }
}