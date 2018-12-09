//
//  SecondViewController.swift
//  2Note
//
//  Created by Rachit Mishra on 24/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController, UIViewControllerTransitioningDelegate,
DataControllerDelegate {
    
    @IBOutlet var nameLabel : UILabel!
    
    @IBOutlet var table: UITableView!
    
    var dataController: DataController!
    
    var fetchedResultsController: NSFetchedResultsController<Note>!
    
    var notes: [Note] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let titleImage = UIImage(named: "peng.png")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = titleImage
        navigationController?.navigationBar.topItem?.titleView = imageView
        navigationController?.navigationBar.barStyle = .default
        let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        let name = UserDefaults.standard.string(forKey: "readableName")
        nameLabel.text = "Hello, \(name ?? "Jon")"
        
        table.delegate = self
        table.dataSource = self
        
        loadData()
    }
    
    func loadData() {
        
        let fetchRequest: NSFetchRequest<Note> = Note.fetchRequest()
        let sortDesc = NSSortDescriptor(key: "edited_on", ascending: false)
        fetchRequest.sortDescriptors = [sortDesc]
        //NSPredicate(format: "attribute = %@", someValue)
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: dataController.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
//        if let result = try? dataController!.viewContext.fetch(fetchRequest) {
//            notes = result
//            table.reloadData()
//        }
        do {
            try fetchedResultsController.performFetch()
        } catch {
           fatalError(error.localizedDescription)
        }
        
    }
    
    @IBAction func addNewNote() {
//        performSegue(withIdentifier: "newNote", sender: self)
        
        let pvc = storyboard?.instantiateViewController(withIdentifier: "NewNote") as! NewNoteViewController
        pvc.view.layer.shadowColor = UIColor.lightGray.cgColor
        pvc.view.layer.shadowRadius = 2
        pvc.view.layer.shadowOffset = CGSize(width: 0, height: -4)
        pvc.view.layer.shadowOpacity = 0.2
        pvc.modalPresentationStyle = .custom
        pvc.transitioningDelegate = self
        pvc.dataController = self.dataController
        
        present(pvc, animated: true, completion: nil)
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return HalfSizePresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    func deleteNote() {
        let alert = UIAlertController(title: "Delete Note", message: "Do you want to delete this note?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: deleteHandler))
        present(alert, animated: true, completion: nil)
    }

    func deleteHandler(alertAction: UIAlertAction) {
        //onDelete?()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        fetchedResultsController = nil
    }
}

