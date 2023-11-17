//
//  OM2App.swift
//  OM2
//
//  Created by Mark Nashed on 11/17/23.
//

import SwiftUI

@main
struct OM2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
