//
//  ViewController.swift
//  SF-CS193
//
//  Created by Rachit Mishra on 04/11/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button: UIButton!
    
    @IBOutlet var button: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onButtonClick() {
        UIViewPropertyAnimator.runningPropertyAnimator(
            withDuration: 0.2,
            delay: 0,
            options: .repeat,
            animations: {
                self.button.transform = CGAffineTransform(
                    scaleX: 0.98, y: 0.98)
                self.button.backgroundColor = UIColor.red
                
        },
            completion: { if $0 == .end {
                self.button.transform = CGAffineTransform(scaleX: 1, y:1)
                }
        }
    )
}

}
