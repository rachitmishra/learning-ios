//
//  SecondViewController.swift
//  2Note
//
//  Created by Rachit Mishra on 24/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var nameLabel : UILabel!
    
    @IBOutlet weak var table: UITableView!

    // Add fetch results controller property
    var fetchedResultsController: NSFetchedResultsController<Note>!
    
    var notes: [Note] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        let name = UserDefaults.standard.string(forKey: "readableName")
        nameLabel.text = "Mon, 25 Dec"
        
        table.delegate = self
        table.dataSource = self
        loadData()
        debugPrint(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    }
    
    func loadData() {
        // Init fetch results controllers
        let fetchRequest: NSFetchRequest<Note> = Note.fetchRequest()

        // Sorting is must for fetch results controllers
        let sortDesc = NSSortDescriptor(key: "edited_on", ascending: false)
        fetchRequest.sortDescriptors = [sortDesc]
//
//        let predicate =  NSPredicate(format: "title LIKE %@", "Other*")
//        fetchRequest.predicate = predicate
//        // IN, LIKE, ==, BETWEEN
//
//        if let result = try? dataController.viewContext.fetch(fetchRequest) {
//            notes = result
//            table.reloadData()
//        }


//        NSFetchedResultsController<Note>.deleteCache(cacheName)

        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: dataController.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        // sectionNameKeyPath can be used to group
        fetchedResultsController.delegate = self
        do {
            try fetchedResultsController.performFetch()
        } catch {
           fatalError(error.localizedDescription)
        }

    }
    
    @IBAction func addNewNote() {
        //performSegue(withIdentifier: "newNote", sender: self)
        
        let pvc = storyboard?.instantiateViewController(withIdentifier: "NewNote") as! NewNoteViewController
        pvc.view.layer.shadowColor = UIColor.lightGray.cgColor
        pvc.view.layer.shadowRadius = 2
        pvc.view.layer.shadowOffset = CGSize(width: 0, height: -4)
        pvc.view.layer.shadowOpacity = 0.2
        pvc.modalPresentationStyle = .custom
        pvc.transitioningDelegate = self
        pvc.onNoteSaved = { result in
            self.loadData()
        }
        
        present(pvc, animated: true, completion: nil)
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return HalfSizePresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    func deleteNote(_ indexPath: IndexPath, note: Note?) {
        let alert = UIAlertController(title: "Delete Note", message: "Do you want to delete this note?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in

            let noteToDelete = self.fetchedResultsController.object(at: indexPath)
            self.dataController.viewContext.delete(noteToDelete)
            self.dataController.viewContext.saveWithGrace()
//            self.loadData()
        }))
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        // De init fetch results controllers
        fetchedResultsController = nil
    }
}

extension NSManagedObjectContext {

    func saveWithGrace() {
        if hasChanges {
            try? save()
        }
    }
}

