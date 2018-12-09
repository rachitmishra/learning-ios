//
//  SecondViewController.swift
//  2Note
//
//  Created by Rachit Mishra on 24/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIViewControllerTransitioningDelegate,
DataControllerDelegate {

    @IBOutlet var nameField: UITextField!
    
    var dataController: DataController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     }
    
    @IBAction func saveName() {
        UserDefaults.standard.set(nameField.text, forKey: "readableName")
        UserDefaults.standard.set(true, forKey: "isFirstLaunch")
        
        performSegue(withIdentifier: "homeScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextViewController = segue.destination as! MainViewController
        nextViewController.dataController = self.dataController
    }
}

