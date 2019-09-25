//
//  DataController.swift
//  Notes
//
//  Created by Rachit Mishra on 15/09/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import Foundation
import CoreData

class DataController {
    
    let persistantContainer: NSPersistentContainer!
    
    var viewContext: NSManagedObjectContext {
        // Main queue
        return persistantContainer.viewContext
    }

    init(modelName: String) {
        persistantContainer = NSPersistentContainer(name: modelName)
    }
    
    func load(completion: (() -> Void)? = nil) {
        persistantContainer.loadPersistentStores { description, error in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
        }
        self.autoSaveViewContext()
        completion?()
    }
}

extension DataController {
    func autoSaveViewContext(interval: TimeInterval = 30) {
        guard interval > 0 else {
            // Blah!
            return
        }
        
        if (viewContext.hasChanges) {
            try? viewContext.save()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            self.autoSaveViewContext()
        }
    }
}
