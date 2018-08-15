//
//  EmojiFieldDelegate.swift
//  LearnDelegate
//
//  Created by Rachit Mishra on 14/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import Foundation
import UIKit

class EmojiTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    var emojis = [String: String]()
    
    override init() {
        super.init()
        
        emojis["cat"] = "\u{E04F}"
        emojis["fish"] = "\u{FE0F}"
        emojis["dog"] = "\u{E052}"
    }
    
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
        
        var replaceEmoji = false
        var emojiStringRange: NSRange
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        for (emojiString, emoji) in emojis {
            repeat {
                emojiStringRange = newText.range(of: emojiString, options: .caseInsensitive)
                if emojiStringRange.location != NSNotFound {
                    newText = newText.replacingCharacters(in: emojiStringRange, with: emoji) as NSString
                    replaceEmoji = true
                }
            } while emojiStringRange.location != NSNotFound
        }
        
        if replaceEmoji {
            textField.text = newText as String
            return false
        } else {
            return true
        }
    }
}
