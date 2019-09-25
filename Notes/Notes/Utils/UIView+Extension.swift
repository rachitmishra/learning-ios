//
//  Extensions.swift
//  Notes
//
//  Created by Rachit Mishra on 15/12/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    
    func setGradientBg(colors: [Substring]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame =  CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        gradientLayer.colors = colors.map {
            UIColor(hex: $0.uppercased()).cgColor
        }
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.95)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.95)
        gradientLayer.type = .axial
        
        // Add shadows
        gradientLayer.shadowRadius = self.layer.shadowRadius
        gradientLayer.shadowColor = self.layer.shadowColor
        
        gradientLayer.cornerRadius = self.layer.cornerRadius
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }

    
}

