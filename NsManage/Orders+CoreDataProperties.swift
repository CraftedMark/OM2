import Foundation
import SwiftUI
import CoreData

extension Orders: Identifiable {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Orders> {
        return NSFetchRequest<Orders>(entityName: "Orders")
    }
    
    @NSManaged public var id: UUID?
    @NSManaged public var orderCompletionDate: Date?
    @NSManaged public var orderDate: Date?
    @NSManaged public var orderTotal: NSDecimalNumber?
    @NSManaged public var paidAmount: NSDecimalNumber?
    @NSManaged public var title: String?
    @NSManaged public var totalAmount: NSDecimalNumber?
    @NSManaged public var customer: Person?
    @NSManaged public var orderedItem: NSSet?
    @NSManaged public var person: Orders?
    

    func setTitleAndTotalAmount() {
        // Assuming 'customer' is a to-one relationship from Orders to Person
        if let customer = self.customer, let firstName = customer.firstName, let orderDate = self.orderDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            formatter.timeStyle = .none
            let dateString = formatter.string(from: orderDate)
            self.title = "\(firstName) \(dateString)"
        }
        // Set the totalAmount to orderTotal as a placeholder
        self.totalAmount = self.orderTotal
    }

    static func createSampleOrder(using context: NSManagedObjectContext) -> Orders {
        let newOrder = Orders(context: context)
        newOrder.orderDate = Date()
        let samplePerson = Person(context: context) // Create a sample Person object
        samplePerson.firstName = "Sample"
        samplePerson.lastName = "Customer"
        newOrder.customer = samplePerson
        newOrder.setTitleAndTotalAmount()
        return newOrder
    }
}

// MARK: Generated accessors for customer
extension Orders {
    @objc(addCustomerObject:)
    @NSManaged public func addToCustomer(_ value: Person)

    @objc(removeCustomerObject:)
    @NSManaged public func removeFromCustomer(_ value: Person)

    @objc(addCustomer:)
    @NSManaged public func addToCustomer(_ values: NSSet)

    @objc(removeCustomer:)
    @NSManaged public func removeFromCustomer(_ values: NSSet)
}

// MARK: Generated accessors for orderedItem
extension Orders {
    @objc(addOrderedItemObject:)
    @NSManaged public func addToOrderedItem(_ value: OrderedItem) // Assuming OrderedItem is a valid entity

    @objc(removeOrderedItemObject:)
    @NSManaged public func removeFromOrderedItem(_ value: OrderedItem) // Assuming OrderedItem is a valid entity

    @objc(addOrderedItem:)
    @NSManaged public func addToOrderedItem(_ values: NSSet)

    @objc(removeOrderedItem:)
    @NSManaged public func removeFromOrderedItem(_ values: NSSet)
}

// MARK: Generated accessors for person
// Assuming there is a valid relationship that needs these accessors, otherwise you can remove these
extension Orders {
    @objc(addPersonObject:)
    @NSManaged public func addToPerson(_ value: Person)

    @objc(removePersonObject:)
    @NSManaged public func removeFromPerson(_ value: Person)

    @objc(addPerson:)
    @NSManaged public func addToPerson(_ values: NSSet)

    @objc(removePerson:)
    @NSManaged public func removeFromPerson(_ values: NSSet)
}

//struct OrdersListView_Previews: PreviewProvider {
//    static var previews: some View {
//        let context = PersistenceController.preview.container.viewContext
//        // Create a sample Order object for preview purposes
//        let _ = Orders.createSampleOrder(using: context)
//        
//        return OrdersListView()
//            .environment(\.managedObjectContext, context)
//    }
//}
