//
//  FirstViewController.swift
//  2Note
//
//  Created by Rachit Mishra on 24/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Get UserDefaults value
        let isNotFirstLaunch = UserDefaults.standard.bool(forKey: "isNotFirstLaunch")
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let welcomeController =
            storyBoard.instantiateViewController(withIdentifier: "welcomeScreen") as! WelcomeViewController
        let mainController =
            storyBoard.instantiateViewController(withIdentifier: "homeScreen") as! MainViewController
        if (isNotFirstLaunch) {
            self.viewControllers = [mainController]
        } else {
            self.viewControllers = [welcomeController]
        }
    }
}

