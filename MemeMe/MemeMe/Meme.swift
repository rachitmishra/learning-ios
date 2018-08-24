//
//  Meme.swift
//  MemeMe
//
//  Created by Rachit Mishra on 23/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import Foundation
import UIKit

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
