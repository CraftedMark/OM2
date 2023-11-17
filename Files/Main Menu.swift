//
//  Main Menu.swift
//  Orders Manager
//
//  Created by Mark Nashed on 11/12/23.
//

import SwiftUI

// Main Menu View
struct MainMenuView: View {
    var body: some View {
        NavigationView {
            List {
                // Each NavigationLink needs to be closed with parentheses
                NavigationLink("Customers", destination: PeopleListView()) // Assuming PeopleListView is a valid View
                NavigationLink("Orders", destination: OrdersListView()) // Assuming OrdersListView is a valid View
                // The rest of the NavigationLinks seem to be closed correctly
                NavigationLink("Products", destination: ProductsPlaceholderView())
                NavigationLink("Recipes", destination: RecipesPlaceholderView())
                NavigationLink("Suppliers", destination: SuppliersPlaceholderView())
                NavigationLink("Billing", destination: BillingPlaceholderView())
            }
            .navigationBarTitle("Operations Manager")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// Preview provider for MainMenuView
struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        // The PersistenceController is assumed to be a part of your project.
        // If it isn't, you'll need to replace it with your Core Data stack setup.
        MainMenuView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
