import SwiftUI
import CoreData

struct PeopleListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Person.lastName, ascending: true)],
        animation: .default)
    private var people: FetchedResults<Person>

    var body: some View {
        NavigationView {
            List {
                ForEach(people) { person in
                    NavigationLink(destination: PersonDetailView(person: person)) {
                        Text(person.fullName)
                    }
                }
            }
            .navigationTitle("People")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink(destination: AddPersonView()) {
                        Label("Add", systemImage: "plus")
                    }
                }
            }
        }
    }
}

struct PeopleListView_Previews: PreviewProvider {
    static var previews: some View {
        // Use an in-memory persistent store for previews
        let context = PersistenceController.preview.container.viewContext

        // Create a few example people to show in the preview
        if context.registeredObjects.isEmpty { // Check to prevent adding duplicates
            for _ in 0..<10 {
                let newPerson = Person(context: context)
                newPerson.firstName = "John"
                newPerson.lastName = "Doe"
                newPerson.email = "john.doe@example.com"
                // Configure other attributes of the Person entity as needed
            }
            do {
                try context.save()
            } catch {
                // Handle the error appropriately
                fatalError("Unresolved error \(error), \((error as NSError).userInfo)")
            }
        }

        // Return the PeopleListView with the preview context
        return PeopleListView()
            .environment(\.managedObjectContext, context)
    }
}
