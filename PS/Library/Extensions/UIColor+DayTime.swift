//
//  UIColor+DayTime.swift
//  PS
//
//  Created by Evandro Harrison Hoffmann on 5/25/17.
//  Copyright © 2017 It's Day Off. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func rgbColor(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: CGFloat(Double(red)/255.0), green: CGFloat(Double(green)/255.0), blue: CGFloat(Double(blue)/255.0), alpha: CGFloat(alpha))
    }
    
    static var colorWithTime: UIColor {
        let hour = Int(Date().toString(format: "HH")) ?? 8
        let minutes = Int(Date().toString(format: "mm")) ?? 0
        
        let hourWithMinutes: Double = Double(hour) + Double(minutes/60)
        return color(withHour: hourWithMinutes)
    }
    
    static func color(withHour hour: Double) -> UIColor {
        switch hour {
        case 6...8:
            return rgbColor(42, 140, 248, 1)
        case 8...17:
            return rgbColor(42, 140, 248, 0.8)
        case 17...18:
            return rgbColor(42, 140, 248, 0.6)
        case 18...19:
            return rgbColor(42, 140, 248, 0.5)
        case 19...20:
            return rgbColor(42, 140, 248, 0.4)
        case 20...22:
            return rgbColor(42, 140, 248, 0.2)
        default:
            return .black
        }
    }
    
}
