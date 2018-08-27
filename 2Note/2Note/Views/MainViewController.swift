//
//  SecondViewController.swift
//  2Note
//
//  Created by Rachit Mishra on 24/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    @IBOutlet var nameLabel : UILabel!
    
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
        downloadImage()
    }
    
    func downloadImage() {
        let url = URL.init(fileURLWithPath: "https://flavorwire.files.wordpress.com/2013/11/calvin-and-hobbes.jpg")
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            print(response)
        }.resume()
    }
    
    @IBAction func addNewNote() {
//        performSegue(withIdentifier: "newNote", sender: self)
        
        let pvc = storyboard?.instantiateViewController(withIdentifier: "NewNote") as! UIViewController
        pvc.view.layer.shadowColor = UIColor.lightGray.cgColor
        pvc.view.layer.shadowRadius = 2
        pvc.view.layer.shadowOffset = CGSize(width: 0, height: -4)
        pvc.view.layer.shadowOpacity = 0.2
        pvc.modalPresentationStyle = .custom
        pvc.transitioningDelegate = self
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
}

