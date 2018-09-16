//
//  NewNoteTextViewDelegate.swift
//  2Note
//
//  Created by Rachit Mishra on 25/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for:indexPath) as! NoteListCell
        let note = self.notes[indexPath.row]
        cell.title.text = note.title
        cell.tags.text = note.tags
        cell.lastEdited.text = note.edited_on?.description
        return cell
    }
    

}

