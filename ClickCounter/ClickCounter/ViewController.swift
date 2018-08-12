//
//  ViewController.swift
//  ClickCounter
//
//  Created by Rachit Mishra on 12/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count = 0
    var initial = 0
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        label.frame = CGRect(x: 100, y: 100, width: 60, height: 60)
        label.text = "0"
        view.addSubview(label)
        self.label = label
        
        let startLabel = UILabel()
        startLabel.frame = CGRect(x: 200, y: 100, width: 60, height: 60)
        startLabel.text = "0"
        view.addSubview(startLabel)
        
        
        let button = UIButton()
        button.frame = CGRect(x: 100, y: 200, width: 100, height: 60)
        button.setTitle("Increment", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        view.addSubview(button)
        
        let button2 = UIButton()
        button2.frame = CGRect(x: 100, y: 300, width: 100, height: 60)
        button2.setTitle("Decrement", for: .normal)
        button2.setTitleColor(UIColor.blue, for: .normal)
        view.addSubview(button2)
        
        
        let button3 = UIButton()
        button3.frame = CGRect(x: 100, y: 400, width: 100, height: 60)
        button3.setTitle("Change color", for: .normal)
        button3.setTitleColor(UIColor.blue, for: .normal)
        view.addSubview(button3)
        
        button.addTarget(self, action: #selector(ViewController.increment), for: UIControlEvents.touchUpInside)
        
        button2.addTarget(self, action: #selector(ViewController.decrement), for: UIControlEvents.touchUpInside)
        
        button3.addTarget(self, action: #selector(ViewController.changeBg), for: UIControlEvents.touchUpInside)
    }
    
    @objc func increment() {
        self.count = count + 1
        self.label.text = "\(self.count)"
    }
    
    @objc func decrement() {
        self.count = count - 1
        self.label.text = "\(self.count)"
    }
    
    @objc func changeBg() {
        self.view.backgroundColor = UIColor.red
    }
}

