//
//  Extensions.swift
//  Notes
//
//  Created by Rachit Mishra on 15/12/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    enum Preference: String {
        case readableName
        case isNotFirstLaunch
    }

    func hideBackButton() {
        let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
    }

    // Explore Generics in Swift
    func getStringPref(forKey key: Preference) -> String? {
        return UserDefaults.standard.string(forKey: key.self.rawValue)
    }
}
