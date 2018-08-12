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
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func increment(_ sender: Any) {
        self.count = self.count + 1
        self.label.text = "\(self.count)"
    }
}

