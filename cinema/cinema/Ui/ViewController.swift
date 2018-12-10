//
//  ViewController.swift
//  cinema
//
//  Created by Rachit Mishra on 09/12/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    private func continueAsGuest() {
        
       
        let url = buildBaseUrl()
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            
            guard let data = data else {
                print("Error")
                return
            }
        }
    }

    private func buildBaseUrl() -> URL {
        let url = ""
        var urlComponents = URLComponents()
        urlComponents.queryItems = [URLQueryItem]()
        urlComponents.queryItems?.append(URLQueryItem(name: "api_key", value:
        "4a3f2df54ca37b88521628ba6ce35ae5"))
        return urlComponents.url!
    }
}

