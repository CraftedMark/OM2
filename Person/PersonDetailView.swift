import SwiftUI
import CoreData

struct PersonDetailView: View {
    let person: Person

    var body: some View {
        List {
            // Assuming 'orders' is a to-many relationship from Person to Order
            // and is a set of NSManaged objects
            ForEach(Array(person.orders as? Set<Orders> ?? []), id: \.self) { order in
                VStack(alignment: .leading) {
                    if let orderDate = order.orderDate {
                        Text("Order Date: \(orderDate.formatted())")
                    } else {
                        Text("Order Date: Unknown")
                    }
                    Text("Order ID: \(order.id!.uuidString)")
                    // Include other properties of Order that you want to display
                }
            }
        }
        .navigationTitle(person.fullName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Example usage of PeopleDetailView
struct PersonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Use the managed object context from the persistent controller
        let context = PersistenceController.preview.container.viewContext
        // Create a sample person for the preview
        let samplePerson = Person(context: context)
        samplePerson.firstName = "John"
        samplePerson.lastName = "Doe"
        return PersonDetailView(person: samplePerson)
            // Provide the context to the preview
            .environment(\.managedObjectContext, context)
    }
}
