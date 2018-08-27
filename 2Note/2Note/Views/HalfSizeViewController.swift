//
//  HalfSizeViewController.swift
//  2Note
//
//  Created by Rachit Mishra on 25/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import Foundation
import UIKit

class HalfSizePresentationController: UIPresentationController {
    override var frameOfPresentedViewInContainerView: CGRect {
        get {
            guard let theView = containerView else {
                return CGRect.zero
            }
            
            return CGRect(x: 0, y: theView.bounds.height/2, width: theView.bounds.width, height: theView.bounds.height/2)
        }
    }
}
