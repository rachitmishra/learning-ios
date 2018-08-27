//
//  SecondViewController.swift
//  2Note
//
//  Created by Rachit Mishra on 24/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let isNotFirstLaunch = UserDefaults.standard.bool(forKey: "isNotFirstLaunch")
        if isNotFirstLaunch {
            performSegue(withIdentifier: "home", sender: self)
        }
     }
    
    @IBAction func saveName() {
        UserDefaults.standard.set(nameField.text, forKey: "readableName")
        UserDefaults.standard.set(true, forKey: "isNotFirstLaunch")
    }
}

