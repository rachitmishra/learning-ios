//
//  NewNoteTextViewDelegate.swift
//  2Note
//
//  Created by Rachit Mishra on 25/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
        return fetchedResultsController.sections?.count ?? 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return notes.count
         return fetchedResultsController.sections?[section].numberOfObjects ?? 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! UITableViewCell

//        let note = self.notes[indexPath.row]
         let note = fetchedResultsController.object(at: indexPath)
        cell.textLabel?.text = note.title
        cell.detailTextLabel?.text = note.tags
//        cell.lastEdited.text = note.edited_on?.description
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let noteToDelete: Note?
        if notes.count > 0 {
            noteToDelete = self.notes[indexPath.row]
        } else {
            noteToDelete = nil
        }
        deleteNote(indexPath, note: noteToDelete)
    }
}

