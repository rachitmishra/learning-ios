//
//  HeaderTextFieldDelegate.swift
//  MemeMe
//
//  Created by Rachit Mishra on 15/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import Foundation
import UIKit

class TextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
        textField.becomeFirstResponder()
    }
}
