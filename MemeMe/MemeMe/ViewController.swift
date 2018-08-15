//
//  ViewController.swift
//  MemeMe
//
//  Created by Rachit Mishra on 15/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    struct Meme {
        
        var header: String!
        var footer: String!
        var originalImage: UIImage!
        var memedImage: UIImage!
        
        init(header: String, footer: String, originalImage: UIImage, memedImage: UIImage) {
            self.header = header
            self.footer = footer
            self.originalImage = originalImage
            self.memedImage = memedImage
        }
    }

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var headerTextField: UITextField!
    @IBOutlet var footerTextField: UITextField!
    
    let textFieldDelegate = TextFieldDelegate()
    
    let textAttributes:[NSAttributedString.Key: Any] = [
        NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!]

    override func viewDidLoad() {
        super.viewDidLoad()
        headerTextField.delegate = textFieldDelegate
        footerTextField.delegate = textFieldDelegate
        headerTextField.defaultTextAttributes = textAttributes
        footerTextField.defaultTextAttributes = textAttributes
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector:
            #selector(keyboardWillShowNotification(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector:
            #selector(keyboardWillHideNotification(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShowNotification(_ notification: Notification) {
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        view.frame.origin.y = -keyboardFrame.height
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
             imageView.image = image
        }
       
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func shareMeme() {
//        let meme = Meme(header: headerTextField.text!,
//                        footer: footerTextField.text!,
//                        originalImage: imageView.image!,
//                        memedImage: generateMeme())
//
//        let activityController = UIActivityViewController()
//        show(activityController, nil)
    }
    
    func generateMeme() -> UIImage {
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return memedImage
    }

}

