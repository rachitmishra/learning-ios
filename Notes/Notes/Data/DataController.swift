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
        return persistantContainer.viewContext
    }

    var backgroundContext: NSManagedObjectContext!
    
    init(modelName: String) {
        persistantContainer = NSPersistentContainer(name: modelName)

//        persistantContainer.performBackgroundTask({ context in
//            // do somthing on background
//        })
//
//        viewContext.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump
    }
    
    func load(completion: (() -> Void)? = nil) {
        persistantContainer.loadPersistentStores { description, error in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
        }
        self.autoSaveViewContext()
        self.configureContexts()
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

    func configureContexts() {
        let backgroundContext = persistantContainer.newBackgroundContext()
        viewContext.automaticallyMergesChangesFromParent = true
        backgroundContext.automaticallyMergesChangesFromParent = true

        backgroundContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        viewContext.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump
    }
}
