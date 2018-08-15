//
//  ViewController.swift
//  LearnDelegate
//
//  Created by Rachit Mishra on 13/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var emojiTextField: UITextField!
    @IBOutlet var colorTextField: UITextField!
    @IBOutlet var counterTextField: UITextField!
    @IBOutlet var switchControlField: UITextField!
    @IBOutlet var counterLabel: UILabel!
    
    let emojiDelegate = EmojiTextFieldDelegate()
    let colorDelegate = ColorTextFieldDelegate()
    let switchDelegate = SwitchTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.isHidden = true
        emojiTextField.delegate = emojiDelegate
        colorTextField.delegate = colorDelegate
        counterTextField.delegate = self
        switchControlField.delegate = switchDelegate
        switchDelegate.isEnabled = false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        // hide the label if the newText will be an empty string
        counterLabel.isHidden = (newText.length == 0)
        
        // Write the length of newText into the label
        counterLabel.text = String(newText.length)
        
        // returning true gives the text field permission to change its text
        return true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    @IBAction func enabledEditor(_ uiSwitch: UISwitch) {
        switchDelegate.isEnabled = uiSwitch.isOn
    }
}

