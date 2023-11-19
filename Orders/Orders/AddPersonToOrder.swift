import SwiftUI
import CoreData

import SwiftUI
import CoreData

struct AddPersonToOrderView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var selectedPerson: Person? // Assuming you have a way to select a person

    var body: some View {
        // UI code to select a person...
        Button("Create New Order for Selected Person") {
            guard let person = selectedPerson else { return }

            let newOrder = Orders(context: managedObjectContext)
            // Configure the new Order properties
            newOrder.id = UUID()
            newOrder.orderDate = Date()
            // ... other order configurations

            person.addToOrders(newOrder) // Use the Core Data generated accessor to add the order

            // Save the context after adding the new order
            do {
                try managedObjectContext.save()
                print("New order created and assigned to person.")
            } catch {
                print("Failed to save the context: \(error.localizedDescription)")
            }
        }
    }
}
