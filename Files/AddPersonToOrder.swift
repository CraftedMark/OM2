//
//  AddPersonToOrder.swift
//  Orders Manager
//
//  Created by Mark Nashed on 11/15/23.
//

import Foundation
import SwiftUI

struct AddPersonToOrderView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var order = Orders() // Replace with your actual Order initialization

    var body: some View {
        // Your view code here...
        Button("Assign Sample Person to Order") {
            let samplePerson = Person.sample(context: managedObjectContext)
            order.customer = samplePerson
            // Save the context after assigning the person to the order
            do {
                try managedObjectContext.save()
            } catch {
                // Handle the error appropriately
                print("Failed to save the context: \(error.localizedDescription)")
            }
        }
    }
}
