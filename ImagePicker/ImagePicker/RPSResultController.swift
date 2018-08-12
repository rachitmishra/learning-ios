//
//  ViewController.swift
//  ImagePicker
//
//  Created by Rachit Mishra on 12/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit

class RPSResultViewController: UIViewController {

    var result: String?
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resultLabel.text = "\(result ?? "")"
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
}

