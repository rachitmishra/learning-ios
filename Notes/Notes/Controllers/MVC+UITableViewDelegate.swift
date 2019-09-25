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
       return fetchedResultsController.sections?.count ?? 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return fetchedResultsController.sections?[section].numberOfObjects ?? 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
            as! UITableViewCell

         let note = fetchedResultsController.object(at: indexPath)
        cell.textLabel?.text = note.title
        cell.detailTextLabel?.text = note.tags
//        cell.lastEdited.text = note.edited_on?.description
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Do something on row selected
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            let noteToDelete: Note?
            if notes.count > 0 {
                noteToDelete = self.notes[indexPath.row]
            } else {
                noteToDelete = nil
            }
            deleteNote(indexPath, note: noteToDelete)
        }

        if (editingStyle == .insert) {
            let noteToDelete: Note?
            if notes.count > 0 {
                noteToDelete = self.notes[indexPath.row]
            } else {
                noteToDelete = nil
            }
            deleteNote(indexPath, note: noteToDelete)
        }
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let shareAction = UITableViewRowAction(style: .normal,
                                                 title: "Share") { action, indexPath in
            //self.bookmarkNote(indexPath, note: nil)
        }
        shareAction.backgroundColor = .green

        let deleteAction = UITableViewRowAction(style: .normal, title: "Reject") { action, indexPath in
            self.deleteNote(indexPath, note: nil)
        }

        deleteAction.backgroundColor = .red
        return [shareAction, deleteAction]
    }

    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let shareAction = UIContextualAction(style: .normal, title:  "Share", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            //self.bookmarkNote(indexPath, note: nil)
        })
       // closeAction.image = UIImage(named: "tick")
        shareAction.backgroundColor = .purple

        return UISwipeActionsConfiguration(actions: [shareAction])

    }

    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let deleteAction = UIContextualAction(style: .normal, title:  "Delete", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            self.deleteNote(indexPath, note: nil)
        })
        //modifyAction.image = UIImage(named: "hammer")
        deleteAction.backgroundColor = .red

        return UISwipeActionsConfiguration(actions: [deleteAction])
    }

}

