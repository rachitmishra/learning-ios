//
//  Rounded.swift
//  2Note
//
//  Created by Rachit Mishra on 24/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit

@IBDesignable class CustomUIButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            if let gradientLayer = self.layer.sublayers?[0] {
                gradientLayer.cornerRadius = cornerRadius
                self.layer.insertSublayer(gradientLayer, at: 0)
            } else {
                self.layer.cornerRadius = cornerRadius
            }
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            if let gradientLayer = self.layer.sublayers?[0] {
                gradientLayer.borderWidth = borderWidth
                self.layer.insertSublayer(gradientLayer, at: 0)
            } else {
                self.layer.borderWidth = borderWidth
            }
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            
            if let gradientLayer = self.layer.sublayers?[0] {
                gradientLayer.borderColor = borderColor.cgColor
                self.layer.insertSublayer(gradientLayer, at: 0)
            } else {
                self.layer.borderColor = borderColor.cgColor
            }
        }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.gray {
        didSet {
            if let gradientLayer = self.layer.sublayers?[0] {
                gradientLayer.shadowColor = shadowColor.cgColor
                self.layer.insertSublayer(gradientLayer, at: 0)
            } else {
                self.layer.shadowColor = shadowColor.cgColor
            }
        }
    }
    
    @IBInspectable var gradientColor: String = "#8E2DE2, #4A00E0" {
        didSet {
    
            let gradientColors = gradientColor.split(separator: ",")
            if let gradientLayer = self.layer.sublayers?[0] {
                self.layer.insertSublayer(gradientLayer, at: 0)
            } else {
                setGradientBg(colors: gradientColors)
            }
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 1.0 {
        didSet {
            
            if let gradientLayer = self.layer.sublayers?[0] {
                gradientLayer.shadowOpacity = shadowOpacity
                self.layer.insertSublayer(gradientLayer, at: 0)
            } else {
                self.layer.shadowOpacity = shadowOpacity
            }
        }
    }
    
    
    @IBInspectable var shadowRadius: CGFloat = 1.0 {
        didSet {
            
            if let gradientLayer = self.layer.sublayers?[0] {
                gradientLayer.shadowRadius = shadowRadius
                self.layer.insertSublayer(gradientLayer, at: 0)
            } else {
                self.layer.shadowRadius = shadowRadius
            }
        }
    }
    
    @IBInspectable var masksToBounds: Bool = true {
        didSet {
            layer.masksToBounds = masksToBounds
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 12, height: 12) {
        didSet {
            
            if let gradientLayer = self.layer.sublayers?[0] {
                gradientLayer.shadowOffset = shadowOffset
                self.layer.insertSublayer(gradientLayer, at: 0)
            } else {
                self.layer.shadowOffset = shadowOffset
            }
        }
    }

}
