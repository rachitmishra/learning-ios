//
//  ViewController.swift
//  ImagePicker
//
//  Created by Rachit Mishra on 12/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func pickImage() {
        // Image picker
        //        let nextController = UIImagePickerController()
        //        present(nextController, animated: true, completion: nil)
        
        // Activity View
        //        let image = UIImage()
        //        let nextController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        /* Alert Controller
         
         let nextController = UIAlertController()
         nextController.title = "Say hi!"
         nextController.message = "Hello or Hi!"
         
         let okAction = UIAlertAction(title: "Ok", style: .default) { action in
         self.dismiss(animated: true, completion: nil)
         }
         let cancelAction = UIAlertAction(title: "Cancel", style: .default) { action in
         self.dismiss(animated: true, completion: nil)
         }
         nextController.addAction(okAction)
         nextController.addAction(cancelAction)
         */
        //        let controller: DiceViewController
        //        controller = storyboard?.instantiateViewController(withIdentifier: "DiceViewController") as! DiceViewController
        //
        //        controller.first = randomValue()
        //        controller.second = randomValue()
        
        //present(controller, animated: true, completion: nil)
        //        dismiss(animated: true, completion: nil)
        self.performSegue(withIdentifier: "diceViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! DiceViewController
        controller.first = randomValue()
        controller.second = randomValue()
    }
    
    
    func randomValue() -> Int{
        let randomValue = 1 + arc4random() % 6
        return Int(randomValue)
    }
    
    
}

