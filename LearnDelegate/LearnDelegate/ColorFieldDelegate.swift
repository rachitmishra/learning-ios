//
//  EmojiFieldDelegate.swift
//  LearnDelegate
//
//  Created by Rachit Mishra on 14/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import Foundation
import UIKit

class ColorTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
       return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
       if textField.text!.contains("red") {
            textField.backgroundColor = UIColor.red
       } else {
            textField.backgroundColor = UIColor.cyan
        }
    
        return true
    }
}
