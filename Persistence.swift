//
//  Persistence.swift
//  OM2
//
//  Created by Mark Nashed on 11/17/23.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newPerson = Person(context: viewContext) // Changed newItem to newPerson and Item to People
            newPerson.timestamp = Date() // Assuming People entity has a timestamp attribute; adjust as needed
            // Configure other attributes of the People entity as needed
        }
        do {
            try viewContext.save()
        } catch {
            // Handle the error appropriately
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentCloudKitContainer

    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "OM2")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        } else {
            // Configure the container to sync with iCloud
            let storeDescription = container.persistentStoreDescriptions.first
            storeDescription?.cloudKitContainerOptions = NSPersistentCloudKitContainerOptions(containerIdentifier: "co.CraftedSolutions.OM2")
            storeDescription?.setOption(true as NSNumber, forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)
            storeDescription?.setOption(true as NSNumber, forKey: NSPersistentHistoryTrackingKey)
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Handle the error appropriately
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }
}
