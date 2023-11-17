import SwiftUI
import CoreData

struct AddPersonView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss

    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var street: String = ""
    @State private var city: String = ""
    @State private var state: String = ""
    @State private var zipCode: String = ""
    @State private var country: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Email", text: $email)
                    TextField("Phone", text: $phone)
                    TextField("Street", text: $street)
                    TextField("City", text: $city)
                    TextField("State", text: $state)
                    TextField("ZIP Code", text: $zipCode)
                    TextField("Country", text: $country)
                }
                Button("Save") {
                    let newPerson = Person(context: viewContext)
                    newPerson.firstName = firstName
                    newPerson.lastName = lastName
                    newPerson.email = email
                    newPerson.phone = phone
                    newPerson.street = street
                    newPerson.city = city
                    newPerson.state = state
                    newPerson.zipCode = zipCode
                    newPerson.country = country

                    do {
                        try viewContext.save()
                        print("Person saved successfully")
                        dismiss()
                    } catch {
                        let nsError = error as NSError
                        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                    }
                }
            }
            .navigationTitle("Add Person")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddPersonView_Previews: PreviewProvider {
    static var previews: some View {
        AddPersonView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
