//
//  OrderListView.swift
//  Orders Manager
//
//  Created by Mark Nashed on 11/15/23.
//

import SwiftUI
import CoreData

struct OrdersListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: Orders.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Orders.orderDate, ascending: true)]
    ) private var orders: FetchedResults<Orders>

    var body: some View {
        List {
            ForEach(orders, id: \.self) { order in
                NavigationLink(destination: OrderRowView(order: order)) {
                    Text(order.orderDate ?? Date(), formatter: itemFormatter) // Replace with your date formatting
                    // Add other details you want to show in the list
                }
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()
