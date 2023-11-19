import SwiftUI
import CoreData

struct AddOrderView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Person.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Person.firstName, ascending: true)])
    var customers: FetchedResults<Person>
    
    @FetchRequest(entity: Products.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Products.name, ascending: true)])
    var products: FetchedResults<Products>
    
    @State private var selectedCustomer: Person?
    @State private var selectedProducts: Set<Products> = []
    @State private var quantities: [UUID: Int16] = [:]
    @State private var total: NSDecimalNumber = NSDecimalNumber.zero
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Customer")) {
                    Picker("Select Customer", selection: $selectedCustomer) {
                        ForEach(customers) { customer in
                            Text(customer.fullName ).tag(customer as Person?)
                        }
                    }
                }
                
                Section(header: Text("Products")) {
                    List(products) { product in
                        ProductPickerRow(product: product, selectedProducts: $selectedProducts, quantities: $quantities)
                    }
                }
                
                Section(header: Text("Total")) {
                    Button("Calculate Total") {
                        calculateTotal()
                    }
                    Text("Total: \(total.currencyFormatted)")
                }
                
                Button("Add Order", action: addOrder)
            }
            .navigationBarTitle("Add Order", displayMode: .inline)
        }
    }
    
    private func calculateTotal() {
        total = NSDecimalNumber.zero
        for product in selectedProducts {
            let quantityNumber = NSDecimalNumber(value: quantities[product.id!] ?? 1)
            let productPrice = product.salePrice ?? NSDecimalNumber.zero
            let productTotal = productPrice.multiplying(by: quantityNumber)
            total = total.adding(productTotal)
        }
    }
    
    private func addOrder() {
        let newOrder = Orders(context: viewContext)
        newOrder.id = UUID()
        newOrder.customer = selectedCustomer
        newOrder.orderDate = Date()
        newOrder.orderTotal = total
        newOrder.setTitleAndTotalAmount()
        
        for product in selectedProducts {
            let orderedItem = OrderedItem(context: viewContext)
            orderedItem.id = UUID()
            // Assuming there is a relationship from OrderedItem to Products
            orderedItem.product = product // This line assumes 'product' is the correct relationship field
            orderedItem.quantity = quantities[product.id!] ?? 1
            newOrder.addToOrderedItem(orderedItem)
        }
        
        do {
            try viewContext.save()
            // Reset the form and close the view after saving.
        } catch {
            // Handle the save error, such as showing an alert to the user.
            print("Error saving order: \(error.localizedDescription)")
        }
    }
}

struct ProductPickerRow: View {
    let product: Products
    @Binding var selectedProducts: Set<Products>
    @Binding var quantities: [UUID: Int16]
    
    var body: some View {
        HStack {
            Text(product.name ?? "Unknown")
            Spacer()
            Stepper(value: Binding(
                get: { quantities[product.id!] ?? 1 },
                set: { quantities[product.id!] = $0 }),
                in: 1...100
            ) {
                Text("Quantity: \(quantities[product.id!] ?? 1)")
            }
        }
        .onTapGesture {
            if selectedProducts.contains(product) {
                selectedProducts.remove(product)
            } else {
                selectedProducts.insert(product)
            }
        }
    }
}

//extension NSDecimalNumber {
//    var currencyFormatted: String {
//        let formatter = NumberFormatter()
//        formatter.numberStyle = .currency
//        return formatter.string(from: self) ?? "N/A"
//    }
//}

struct AddOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddOrderView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
