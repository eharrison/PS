//
//  SceneComponent.swift
//  PS
//
//  Created by Evandro Harrison Hoffmann on 5/28/17.
//  Copyright © 2017 It's Day Off. All rights reserved.
//

import UIKit

class SceneComponent: DesignableView {
    
    var pulseTimer: Timer?
    var pulseNormalScale: CGFloat = 1
    var pulseMaxScale: CGFloat = 1.1
    var pulseAnimationTime: Double = 0.8
    var animationTime: Double = 2
    
    override func awakeFromNib() {
        self.isHidden = true
    }
    
    // MARK: - Animations
    
    func show() {
        self.isHidden = false
    }
    
    func hide() {
        UIView.animate(withDuration: animationTime, delay: 0, options: .curveEaseIn, animations: {
            self.alpha = 0
        }) { (completed) in
            self.removeFromSuperview()
        }
    }
    
    func pulse(){
        UIView.animate(withDuration: pulseAnimationTime, delay: 0, options: .curveEaseIn, animations: {
            self.transform = CGAffineTransform(scaleX: self.pulseMaxScale, y: self.pulseMaxScale)
            self.alpha = 0.8
        }) { (Bool) in
            UIView.animate(withDuration: self.pulseAnimationTime, delay: 0, options: .curveEaseOut, animations: {
                self.transform = CGAffineTransform(scaleX: self.pulseNormalScale, y: self.pulseNormalScale)
                self.alpha = 1
            })
        }
    }
}
