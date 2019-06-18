//
//  NewNoteTextViewDelegate.swift
//  2Note
//
//  Created by Rachit Mishra on 25/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit
import CoreData

extension MainViewController: NSFetchedResultsControllerDelegate {

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            table.insertRows(at: [newIndexPath!], with: .fade)
//        case .update:
//            table.reloadRows(at: [newIndexPath!], with: .fade)
        default:
            table.deleteRows(at: [indexPath!], with: .fade)
        }
    }

    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        table.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        table.endUpdates()
    }
}

