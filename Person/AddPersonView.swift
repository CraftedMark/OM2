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
    @State private var isSaving = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                }
                
                Section(header: Text("Contact")) {
                    TextField("Email", text: $email)
                    TextField("Phone", text: $phone)
                }
                
                Section(header: Text("Address")) {
                    TextField("Street", text: $street)
                    TextField("City", text: $city)
                    TextField("State", text: $state)
                    TextField("ZIP Code", text: $zipCode)
                    TextField("Country", text: $country)
                }
                
                Section {
                    Button(action: savePerson) {
                        if isSaving {
                            ProgressView()
                        } else {
                            Text("Save")
                        }
                    }
                    .disabled(!canSave)
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
    
    private var canSave: Bool {
        // Add your validation logic here
        !firstName.isEmpty && !lastName.isEmpty
    }
    
    private func savePerson() {
        isSaving = true
        
        // Create a new Person instance
        let newPerson = Person(context: viewContext)
        
        // Set the properties
        newPerson.firstName = firstName
        newPerson.lastName = lastName
        newPerson.email = email
        newPerson.phone = phone
        newPerson.street = street
        newPerson.city = city
        newPerson.state = state
        newPerson.zipCode = zipCode
        newPerson.country = country
        
        // Save the context
        do {
            try viewContext.save()
            // Handle the save success (e.g., dismiss the view or clear the form)
            dismiss()
        } catch {
            // Handle the save error (e.g., show an error message to the user)
            print("Error saving person: \(error.localizedDescription)")
            // Implement further error handling and user notification as needed
        }
        
        isSaving = false
    }
    struct AddPersonView_Previews: PreviewProvider {
        static var previews: some View {
            AddPersonView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
