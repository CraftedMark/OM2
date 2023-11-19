import SwiftUI
import CoreData

struct OrderRowView: View {
    @ObservedObject var order: Orders  // Assuming 'Orders' is an NSManagedObject subclass

    var body: some View {
           HStack {
               VStack(alignment: .leading, spacing: 8) {
                   // Ensure that the date is converted to a string for interpolation
                   if let orderDate = order.orderDate {
                       Text("Date: \(orderDate, formatter: DateFormatter.orderDateFormatter)")
                   }
                HStack {
                    Image(systemName: (order.isFullyPaid) ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .foregroundColor((order.isFullyPaid) ? .green : .red)
                    Text(order.isFullyPaid ? "Paid" : "Pending")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                if let firstCustomer = order.customers?.first as? Person {
                    Text("Customer: \(firstCustomer.fullName)")
                        .font(.subheadline)
                }
            }
            Spacer()
            // You can add more information or controls here if needed
        }
        .padding()
    }
}



// Define an appropriate NumberFormatter for currency
extension NumberFormatter {
    static let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
}

//// Convenience extension for NSDecimalNumber to return a currency formatted string
//extension NSDecimalNumber {
//    var currencyFormatted: String {
//        NumberFormatter.currencyFormatter.string(from: self) ?? "0.00"
//    }
//}

// Convenience extension for Orders to calculate if fully paid
extension Orders {
    var isFullyPaid: Bool {
        orderTotal == paidAmount
    }
    
    // Assuming the Person entity has firstName and lastName attributes
    var customers: Set<Person>? {
        get { customer as? Set<Person> }
        // If there's a setter involved, implement it accordingly
    }
}


//struct OrderRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        let context = PersistenceController.preview.container.viewContext
//        let sampleOrder = Orders(context: context)
//        // Configure the sample order properties
//        sampleOrder.orderTotal = NSDecimalNumber(string: "100.00")
//        sampleOrder.paidAmount = NSDecimalNumber(string: "100.00")
//        sampleOrder.orderDate = Date()
//        // Create a sample customer to associate with the order
//        let sampleCustomer = Person(context: context)
//        sampleCustomer.firstName = "Jane"
//        sampleCustomer.lastName = "Doe"
//        sample
//        Order.customer = NSSet(object: sampleCustomer)
//        // Configure additional properties if needed...
//        
//        return OrderRowView(order: sampleOrder)
//            .previewLayout(.sizeThatFits)
//            .padding()
//            .environment(\.managedObjectContext, context)
//    }
//}
