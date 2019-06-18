//
//  NewNoteTextViewDelegate.swift
//  2Note
//
//  Created by Rachit Mishra on 25/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit

extension NewNoteViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.becomeFirstResponder()
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        return textView.resignFirstResponder()
    }
}

