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
    
    init(modelName: String) {
        persistantContainer = NSPersistentContainer(name: modelName)
    }
    
    func load(completion: (() -> Void)?) {
        persistantContainer.loadPersistentStores { description, error in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
        }
        autoSaveViewContext()
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
