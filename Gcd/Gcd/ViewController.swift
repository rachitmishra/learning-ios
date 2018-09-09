//
//  ViewController.swift
//  Gcd
//
//  Created by Rachit Mishra on 09/09/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func syncDownload() {
        if let url = URL(string: "https://source.unsplash.com/random/800x600"),
            let data: Data = try! Data(contentsOf:url),
            let image = UIImage(data:data) {
            self.image.image = image
        }
    }
    
    @IBAction func simpleAsyncDowload() {
        let url = URL(string: "https://source.unsplash.com/random/800x600")
        let q = DispatchQueue(label:"download")
        
        q.async {
            let data: Data = try! Data(contentsOf:url!)
            let image = UIImage(data:data)
            
            DispatchQueue.main.async {
                self.image.image = image
            }
        }
    }
    
    @IBAction func asyncDownload() {
        withBigImage {
            self.image.image = $0
        }
    }
    
    func withBigImage(completionHandler handler: @escaping (_ image: UIImage) -> Void) {
        let url = URL(string: "https://source.unsplash.com/random/800x600")
        let q = DispatchQueue(label:"download", qos: .userInitiated)
        
        q.async {
            let data: Data = try! Data(contentsOf:url!)
            let image = UIImage(data:data)
            
            DispatchQueue.main.async {
                handler(image!)
            }
        }
    }
    
    @IBAction func setAlpha(slider: UISlider) {
        image.alpha = CGFloat(slider.value)
    }
}

