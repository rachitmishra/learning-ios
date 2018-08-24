//
//  ViewController.swift
//  Navigation
//
//  Created by Rachit Mishra on 16/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let detailController = storyboard?.instantiateViewController(withIdentifier: "finalViewController") as! FinalViewController
        navigationController?.pushViewController(detailController, animated: true)
    }
}

