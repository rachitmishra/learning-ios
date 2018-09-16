//
//  NewNoteViewController.swift
//  2Note
//
//  Created by Rachit Mishra on 25/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit
import CoreData

class NewNoteViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, DataControllerDelegate {

    @IBOutlet var noteTextView: UITextView!
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var tagTextField: UITextField!
    
    var dataController: DataController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let lastEditedText = UserDefaults.standard.string(forKey: "lastEditedText") {
            self.noteTextView.text = lastEditedText
        }
        
        noteTextView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        do {
            let content = try String(contentsOf: getUrl()!, encoding: String.Encoding.utf8)
            
            self.noteTextView.text = content
        } catch {
            print("Something went wrong")
        }
        
        NotificationCenter.default.addObserver(self, selector:
            #selector(keyboardWillShowNotification(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector:
            #selector(keyboardWillHideNotification(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UserDefaults.standard.set(noteTextView.text, forKey: "lastEditedText")
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShowNotification(_ notification: Notification) {
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        view.frame.origin.y = view.frame.origin.y - keyboardFrame.height
    }
    
    @objc func keyboardWillHideNotification(_ notification: Notification) {
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        view.frame.origin.y = view.frame.origin.y + keyboardFrame.height
    }
    
    @IBAction func pickImage() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func openCamera() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .camera
        present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
           //
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    private func getUrl() -> URL? {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        return urls.last?.appendingPathComponent("note.txt")
    }
    
    @IBAction func saveNote() {
        do {
            try noteTextView.text.write(to: getUrl()!, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("Error while writing")
        }
        

        let tags: [Substring] = tagTextField.text?.split(separator: ",") ?? []
        let note = Note(context: self.dataController.viewContext)
        note.title = titleTextField.text
        note.text = noteTextView.text
        note.created_on = Date()
        note.edited_on = Date()
        note.tags = tagTextField.text
        try? dataController.viewContext.save()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func attachment() {
        
    }
}
