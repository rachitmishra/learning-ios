//
//  ViewController.swift
//  ImagePicker
//
//  Created by Rachit Mishra on 12/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit

class DiceViewController: UIViewController {

    var first: Int?
    var second: Int?
    @IBOutlet var firstLabel: UILabel!
    @IBOutlet var secondLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        firstLabel.text = "\(first ?? 0)"
        secondLabel.text = "\(second ?? 0)"
    }
    
    @IBAction func close() {
         dismiss(animated: true, completion: nil)
    }

}

