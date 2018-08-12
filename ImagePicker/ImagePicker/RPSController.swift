//
//  ViewController.swift
//  ImagePicker
//
//  Created by Rachit Mishra on 12/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit

class RPSViewController: UIViewController {
    
    var clicked: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showResult(_ sender: UIButton!) {
        clicked = sender.tag as? Int
        
        performSegue(withIdentifier: "rpsResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! RPSResultViewController
        controller.result = getResult()
    }
    
    func getResult() -> String {
        let randomValue = 1 + arc4random() % 3
        if Int(randomValue) == clicked {
            return "Match!"
        } else {
            return "No Match!"
        }
    }
}

