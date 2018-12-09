//
//  Note+Extension.swift
//  Notes
//
//  Created by Rachit Mishra on 17/09/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import Foundation
import CoreData

extension Note {
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        created_on = Date()
    }
}
