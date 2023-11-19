//
//  CloudKitObserver.swift
//  OM2
//
//  Created by Mark Nashed on 11/18/23.
//

import CoreData
import CloudKit

class CloudKitObserver {

    private var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
        setupNotificationHandling()
    }
    
    private func setupNotificationHandling() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(storeRemoteChange(_:)),
            name: .NSPersistentStoreRemoteChange,
            object: context.persistentStoreCoordinator
        )
    }
    
    @objc private func storeRemoteChange(_ notification: Notification) {
        // Handle the remote change notification
        // You can perform additional fetches here if needed to check the new data
        print("Remote change to persistent store: \(notification)")
    }
}

// Usage:
// let cloudKitObserver = CloudKitObserver(context: yourManagedObjectContext)
