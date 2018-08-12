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
    @IBOutlet var redSwitch: UISwitch!
    @IBOutlet var greenSwitch: UISwitch!
    @IBOutlet var blueSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeColor()
    }
    
    @IBAction func changeColor() {
        let r: CGFloat = self.redSwitch.isOn ? 1 : 0
        let g: CGFloat = self.greenSwitch.isOn ? 1 : 0
        let b: CGFloat = self.blueSwitch.isOn ? 1 : 0
        
        self.colorView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
    }
}

