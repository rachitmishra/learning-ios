//
//  Rounded.swift
//  2Note
//
//  Created by Rachit Mishra on 24/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit

@IBDesignable class CustomUIView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.gray {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var IbShadowOpacity: Float = 1.0 {
        didSet {
            layer.shadowOpacity = IbShadowOpacity
        }
    }
    
    
    @IBInspectable var IbShadowRadius: CGFloat = 1.0 {
        didSet {
            layer.shadowRadius = IbShadowRadius
        }
    }
    
    @IBInspectable var IbMasksToBounds: Bool = true {
        didSet {
            layer.masksToBounds = IbMasksToBounds
        }
    }
    
    @IBInspectable var IbShadowOffset: CGSize = CGSize(width: 12, height: 12) {
        didSet {
            layer.shadowOffset = IbShadowOffset
        }
    }

}
