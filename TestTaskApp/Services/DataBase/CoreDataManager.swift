//
//  CoreDataManager.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import Foundation
import CoreData

final class CoreDataManager {
    
    private let modelName: String
    
    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                debugPrint("Unresolved error \(error), \(error.userInfo)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        return container
    }()
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
    lazy var managedContext: NSManagedObjectContext = self.storeContainer.viewContext
    
    func save() async -> Bool {
        let hasChanges = await managedContext.perform { [weak self] in
            self?.managedContext.hasChanges
        }
        guard hasChanges == true else {
            return false
        }
        do {
            try await managedContext.perform { [weak self] in
                try self?.managedContext.save()
            }
            
            return true
        } catch let error as NSError {
            debugPrint("Unresolved error \(error), \(error.userInfo)")
            
            return false
        }
    }
}
