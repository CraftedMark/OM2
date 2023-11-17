//
//  ContentView.swift
//  OM2
//
//  Created by Mark Nashed on 11/17/23.
//


//import SwiftUI
//import CoreData
//
//struct MainMenuView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//
//    var body: some View {
//        NavigationView {
//            List {
//                NavigationLink("Customers", destination: PeopleListView())
//                NavigationLink("Orders", destination: OrdersListView())
//                NavigationLink("Products", destination: ProductsPlaceholderView())
//                NavigationLink("Recipes", destination: RecipesPlaceholderView())
//                NavigationLink("Suppliers", destination: SuppliersPlaceholderView())
//                NavigationLink("Billing", destination: BillingPlaceholderView())
//            }
//            .navigationBarTitle("Operations Manager")
//            .navigationBarTitleDisplayMode(.inline)
//        }
//    }
//}
//
//// Preview provider for MainMenuView
//struct MainMenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainMenuView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}


//import SwiftUI
//import CoreData
//

//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
//
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                    } label: {
//                        Text(item.timestamp!, formatter: itemFormatter)
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//            Text("Select an item")
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//}
//
//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()
//
//#Preview {
//    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//}
