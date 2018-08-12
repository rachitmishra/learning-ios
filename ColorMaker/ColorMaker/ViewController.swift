//
//  ViewController.swift
//  ColorMaker
//
//  Created by Rachit Mishra on 12/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeColor()
    }
    
    @IBAction func changeColor() {
        let rf = redSlider.value
        let r: CGFloat = CGFloat(rf)
        let gf = greenSlider.value
        let g: CGFloat = CGFloat(gf)
        let bf = blueSlider.value
        let b: CGFloat = CGFloat(bf)
        
        self.colorView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
    }
}

