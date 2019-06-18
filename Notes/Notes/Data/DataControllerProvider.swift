//
//  HasDataController.swift
//  Notes
//
//  Created by Rachit Mishra on 16/12/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit

protocol DataControllerProvider {
    
    var dataController: DataController {get}
}

extension UIViewController: DataControllerProvider {
    
    var dataController: DataController {
        return AppDelegate.dataController()
    }
}
