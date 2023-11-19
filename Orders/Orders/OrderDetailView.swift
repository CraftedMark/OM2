import SwiftUI
import CoreData

// Helper extensions should be at the top level, not nested within other extensions or types
extension DateFormatter {
    static let orderDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter
    }()
}

extension NSDecimalNumber {
    var currencyFormatted: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: self) ?? "N/A"
    }
}

//// If OrderedItem has a 'name' attribute, make sure it's included in the OrderedItem class
//extension OrderedItem: Identifiable {
//    // No need to add Hashable conformance again, it's inherited from NSManagedObject
//    public var name: String? {
//        return self.name
//    }
//}

// Make sure the extension on Orders is using the correct property names as defined in your Core Data model
extension Orders {
    var orderedItemsArray: [OrderedItem] {
        let set = orderedItem as? Set<OrderedItem> ?? []
        return set.sorted { ($0.name ?? "") < ($1.name ?? "") }
    }
}

struct OrderDetailView: View {
    @ObservedObject var order: Orders
    
    var body: some View {
        List {
            Section(header: Text("Order Info")) {
                HStack {
                    Text("Order ID:")
                    Spacer()
                    Text(order.id?.uuidString ?? "Unknown ID")
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                }
                
                HStack {
                    Text("Order Date:")
                    Spacer()
                    if let orderDate = order.orderDate {
                        Text(orderDate, formatter: DateFormatter.orderDateFormatter)
                            .foregroundColor(.gray)
                    } else {
                        Text("N/A")
                            .foregroundColor(.gray)
                    }
                }
            }
            
            Section(header: Text("Customer Info")) {
                if let customer = order.customer {
                    Text("Name: \(customer.fullName)")
                    Text("Email: \(customer.email ?? "N/A")")
                }
            }
            
            Section(header: Text("Order Details")) {
                ForEach(order.orderedItemsArray, id: \.self) { item in
                    Text(item.name ?? "Unknown Item")
                }
                
                HStack {
                    Text("Total Amount:")
                    Spacer()
                    Text(order.totalAmount!.currencyFormatted)
                        .fontWeight(.bold)
                }
            }
            
            Section(header: Text("Payment Status")) {
                HStack {
                    Text("Paid Amount:")
                    Spacer()
                    Text(order.paidAmount?.currencyFormatted ?? "0")
                }
                
                HStack {
                    Text("Remaining:")
                    Spacer()
                   
                }
            }
            .navigationTitle("Order Details")
            .listStyle(GroupedListStyle())
            .toolbar {
                Button("Mark as Complete") {
                    // Action to mark order as complete
                }
            }
        }
    }
    
    // Define the preview provider at the end of the file, outside of any other types
    struct OrderDetailView_Previews: PreviewProvider {
        static var previews: some View {
            let context = PersistenceController.preview.container.viewContext
            let newOrder = Orders(context: context)
            // Configure your order object for preview
            return OrderDetailView(order: newOrder)
                .environment(\.managedObjectContext, context)
        }
    }
}
