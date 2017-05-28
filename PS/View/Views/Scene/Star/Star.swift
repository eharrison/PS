//
//  Star.swift
//  PS
//
//  Created by Evandro Harrison Hoffmann on 5/28/17.
//  Copyright © 2017 It's Day Off. All rights reserved.
//

import UIKit

class Star: SceneComponent {
    
    static func newStar() -> Star?{
        return Bundle(for: self).loadNibNamed("Star", owner: self, options: nil)![0] as? Star
    }
    
    // MARK: - Animations
    
    override func show() {
        let superviewFrame = self.superview?.frame ?? CGRect()
        
        self.isHidden = false
        
        self.center = CGPoint(x: CGFloat(arc4random()).truncatingRemainder(dividingBy: superviewFrame.size.width), y: CGFloat(arc4random()).truncatingRemainder(dividingBy: superviewFrame.size.height))
        
        let scale = 1/CGFloat(arc4random()).truncatingRemainder(dividingBy: 10)
        self.transform = CGAffineTransform(scaleX: scale, y: scale)
        
        UIView.animate(withDuration: animationTime, delay: 0, options: .curveEaseOut, animations: {
            self.alpha = 1
        }) { (completed) in
            self.pulseAnimationTime = 2
            self.pulseNormalScale = scale
            self.pulseMaxScale = scale*1.1
            self.pulse()
            self.pulseTimer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(Star.pulse), userInfo: nil, repeats: true)
        }
    }
    
}

// MARK: - UIView Extensions

extension UIView {
    
    func showStars(count: Int) {
        hideStar()
        
        for _ in 0..<count {
            showStar()
        }
    }
    
    func showStar(){
        if let star = Star.newStar() {
            self.addSubview(star)
            star.show()
        }
    }
    
    func hideStar(){
        for subview in subviews{
            if let subview = subview as? Star {
                subview.hide()
            }
        }
    }
}
