//
//  UpdateToAttributesStringPolicy.swift
//  Notes
//
//  Created by Rachit Mishra on 18/06/19.
//  Copyright © 2019 ceeq. All rights reserved.
//

import CoreData
import UIKit

class UpdateToAttributedStringsPolicy: NSEntityMigrationPolicy {

    override func createDestinationInstances(forSource sInstance: NSManagedObject, in mapping: NSEntityMapping, manager: NSMigrationManager) throws {
        // Call super
        try super.createDestinationInstances(forSource: sInstance, in: mapping, manager: manager)

        // Get the (updated) destination Note instance we're modifying
        guard let destination = manager.destinationInstances(forEntityMappingName: mapping.name, sourceInstances: [sInstance]).first else { return }

        // Use the (original) source Note instance, and instantiate a new
        // NSAttributedString using the original string
        if let text = sInstance.value(forKey: "text") as? String {
            destination.setValue(NSAttributedString(string: text), forKey: "text")
        }
    }
}
