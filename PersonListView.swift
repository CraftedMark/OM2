import SwiftUI
import CoreData

struct PeopleListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Person.lastName, ascending: true)], // KeyPath should be on Person entity
        animation: .default)
    private var people: FetchedResults<Person> // Change variable name to plural to represent multiple people

    var body: some View {
        NavigationView {
            List(people, id: \.self) { person in
                NavigationLink(destination: PersonDetailView(person: person)) {
                    Text(person.firstName ?? "Unknown") + Text(" ") + Text(person.lastName ?? "Unknown")
                }
            }
            .navigationTitle("People")
            .toolbar {
                // Navigation to the `AddPersonView`
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink(destination: AddPersonView()) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}
