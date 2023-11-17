import SwiftUI
import CoreData

struct OrderRowView: View {
    @ObservedObject var order: Orders  // Assuming 'Orders' is an NSManagedObject subclass

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                if let orderDate = order.orderDate {
                    Text("Date: \(orderDate.formatted(date: .abbreviated, time: .omitted))")
                        .font(.subheadline)
                }
                // Directly accessing the 'orderTotal' property without casting
                Text("Total: \(order.orderTotal.stringValue)")
                    .font(.headline)
                // Assuming there's a paid amount and you want to show if the order is fully paid or not
                Image(systemName: order.orderTotal.compare(order.paidAmount) == .orderedSame ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .foregroundColor(order.orderTotal.compare(order.paidAmount) == .orderedSame ? .green : .red)
                if let customerName = order.customer?.fullName {
                    Text("Customer: \(customerName)")
                        .font(.subheadline)
                }
            }
            Spacer()
        }
        .padding()
    }
}

struct OrderRowView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let sampleOrder = Orders(context: context)
        // Configure the sample order properties
        sampleOrder.orderTotal = NSDecimalNumber(string: "100.00")
        sampleOrder.paidAmount = NSDecimalNumber(string: "100.00")
        // More configuration as needed...
        return OrderRowView(order: sampleOrder)
            .previewLayout(.sizeThatFits)
            .padding()
            .environment(\.managedObjectContext, context)
    }
}
