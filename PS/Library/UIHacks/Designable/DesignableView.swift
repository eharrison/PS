//
//  DesignableView.swift
//  MV UI Hacks
//
//  Created by Evandro Harrison Hoffmann on 06/07/2016.
//  Copyright © 2016 It's Day Off. All rights reserved.
//

import UIKit

enum ShapeType: Int {
    case `default` = 0
    case hexagon = 1
    case hexagonVertical = 2
}

@IBDesignable
open class DesignableView: UIView {
    
    var shadowLayer: UIView?
    
    // MARK: - Shapes
    
    @IBInspectable open var shapeType: Int = 0{
        didSet{
            updateShape(shapeType)
        }
    }
    
    open func updateShape(_ shapeType: Int){
        switch shapeType {
        case ShapeType.hexagon.rawValue:
            self.addHexagonalMask(0)
            break
        case ShapeType.hexagonVertical.rawValue:
            self.addHexagonalMask(CGFloat(Double.pi/2))
            break
        default:
            break
        }
    }
    
    @IBInspectable open var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable open var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable open var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    
    // MARK: - Colors
    
    @IBInspectable open var gradientTopColor: UIColor = UIColor.clear {
        didSet{
            self.addGradientLayer(gradientTopColor, bottomColor: gradientBottomColor)
        }
    }
    
    @IBInspectable open var gradientBottomColor: UIColor = UIColor.clear {
        didSet{
            self.addGradientLayer(gradientTopColor, bottomColor: gradientBottomColor)
        }
    }
    
    @IBInspectable open var shadowColor: UIColor = UIColor.clear {
        didSet{
            updateShadow()
        }
    }
    
    @IBInspectable open var shadowOffset: CGSize = CGSize.zero {
        didSet{
            updateShadow()
        }
    }
    
    @IBInspectable open var shadowOpacity: Float = 0 {
        didSet{
            updateShadow()
        }
    }
    
    @IBInspectable open var shadowRadius: CGFloat = 0 {
        didSet{
            updateShadow()
        }
    }
    
    @IBInspectable open var isTriangle: Bool = false {
        didSet{
            
        }
    }
    
    @IBInspectable open var triangleColor: UIColor = UIColor.white {
        didSet{
            
        }
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        addGradientLayer(gradientTopColor, bottomColor: gradientBottomColor)
        updateShape(shapeType)
        
        if(self.shadowRadius > 0) {
            if shadowLayer != nil {
                shadowLayer?.removeFromSuperview()
                shadowLayer = nil
            }
            
            shadowLayer = UIView(frame: self.frame)
            shadowLayer!.backgroundColor = UIColor.clear
            shadowLayer!.layer.shadowColor = self.shadowColor.cgColor
            shadowLayer!.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornerRadius).cgPath
            shadowLayer!.layer.shadowOffset = self.shadowOffset
            shadowLayer!.layer.shadowOpacity = self.shadowOpacity
            shadowLayer!.layer.shadowRadius = self.shadowRadius
            shadowLayer!.layer.shouldRasterize = true
            shadowLayer!.layer.masksToBounds = true
            shadowLayer!.clipsToBounds = false
            
            self.superview?.addSubview(shadowLayer!)
            self.superview?.bringSubview(toFront: self)
            
        }
    }
    
    open override func draw(_ rect: CGRect) {
        
        if self.isTriangle {
            addTringleView(rect, fillColor: self.triangleColor)
        }
        
    }
    
    // MARK: - Shadow
    
    open func updateShadow() {
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowPath = UIBezierPath(rect: self.layer.bounds).cgPath
        self.layer.masksToBounds = true // this will not update the shadow, but fixes the corner radius
    }
}
