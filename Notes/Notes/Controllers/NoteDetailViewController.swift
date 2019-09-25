//
//  SecondViewController.swift
//  2Note
//
//  Created by Rachit Mishra on 24/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit
import CoreData

class NoteDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel : UILabel!
    
    @IBOutlet weak var tagsLabel: UILabel!

    @IBOutlet weak var detailLabel: UILabel!

    var selectedNote: Note? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        loadNote()
    }
    
    func loadNote() {
        if let note = selectedNote {
            titleLabel.text = note.title
            tagsLabel.text = note.tags
            detailLabel.text = note.text
        }
    }
}

