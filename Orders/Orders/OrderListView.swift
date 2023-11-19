import SwiftUI
import CoreData

struct OrdersListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: Orders.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Orders.orderDate, ascending: true)]
    ) var orders: FetchedResults<Orders>

    @State private var showingAddOrderView = false

    var body: some View {
        NavigationView {
            List {
                ForEach(orders) { order in
                    NavigationLink(destination: OrderDetailView(order: order)) {
                        OrderRow(order: order)
                    }
                }
                .onDelete(perform: deleteOrders)
            }
            .navigationTitle("Orders")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { showingAddOrderView = true }) {
                        Label("Add Order", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddOrderView) {
                AddOrderView().environment(\.managedObjectContext, viewContext)
            }
        }
    }
    
    private func deleteOrders(offsets: IndexSet) {
        withAnimation {
            offsets.map { orders[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func addOrder() {
        withAnimation {
            // Implement the logic for adding a new order
        }
    }
}

struct OrderRow: View {
    var order: Orders

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(order.title ?? "New Order") // Assuming 'title' is a String attribute of 'Orders'
                    .font(.headline)
                if let orderDate = order.orderDate {
                    Text("Date: \(orderDate, formatter: itemFormatter)")
                        .font(.subheadline)
                } else {
                    Text("Date: N/A")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Text("Total: \(order.totalAmount!.currencyFormatted)") // Assuming 'totalAmount' is a NSDecimalNumber attribute of 'Orders'
                    .font(.subheadline)
            }
            Spacer()
            // Assuming you have an isComplete property or method
            if (order.isComplete) {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(.green)
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.timeStyle = .none
    return formatter
}()

extension Orders {
    // Assuming 'isComplete' is a Boolean attribute of 'Orders'
    var isComplete: Bool {
        // Implement this based on your business logic
        // For example, if an order is complete when paidAmount equals orderTotal
        return self.paidAmount == self.orderTotal
    }
}

struct OrdersListView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        // Create a few example orders to show in the preview
        for _ in 0..<10 {
            let newOrder = Orders(context: context)
            newOrder.orderDate = Date()
            newOrder.totalAmount = NSDecimalNumber(string: "100.00")
            newOrder.title = "New Order Preview"
            // Assuming 'title' and 'totalAmount' are attributes of 'Orders'
        }
        do {
            try context.save()
        } catch {
            // Handle error appropriately
            fatalError("Unresolved error \(error)")
        }

        return OrdersListView().environment(\.managedObjectContext, context)
    }
}
