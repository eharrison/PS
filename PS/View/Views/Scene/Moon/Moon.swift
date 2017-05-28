//
//  Moon.swift
//  PS
//
//  Created by Evandro Harrison Hoffmann on 5/28/17.
//  Copyright © 2017 It's Day Off. All rights reserved.
//

import UIKit

let moonAnimationTime = 2.0

class Moon: SceneComponent {
    
    static func newMoon() -> Moon?{
        return Bundle(for: self).loadNibNamed("Moon", owner: self, options: nil)![0] as? Moon
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
    
    func showMoon(){
        if let moon = Moon.newMoon() {
            self.addSubview(moon)
            moon.show()
        }
    }
    
    func hideMoon(){
        for subview in subviews{
            if let subview = subview as? Moon {
                subview.hide()
            }
        }
    }
}
