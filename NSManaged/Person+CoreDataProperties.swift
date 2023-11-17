//
//  Person+CoreDataProperties.swift
//  OM2
//
//  Created by Mark Nashed on 11/17/23.
//
//

import Foundation
import CoreData


extension Person : Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var city: String?
    @NSManaged public var country: String?
    @NSManaged public var email: String?
    @NSManaged public var firstName: String?
    @NSManaged public var id: UUID?
    @NSManaged public var lastName: String?
    @NSManaged public var phone: String?
    @NSManaged public var state: String?
    @NSManaged public var street: String?
    @NSManaged public var timestamp: Date?
    @NSManaged public var zipCode: String?
    @NSManaged public var customer: Person?
    @NSManaged public var expenses: Person?
    @NSManaged public var orders: NSSet?

    @objc(addOrdersObject:)
    @NSManaged public func addToOrders(_ value: Person)

    @objc(removeOrdersObject:)
    @NSManaged public func removeFromOrders(_ value: Person)

    @objc(addOrders:)
    @NSManaged public func addToOrders(_ values: NSSet)

    @objc(removeOrders:)
    @NSManaged public func removeFromOrders(_ values: NSSet)

}
// MARK: - Computed Properties

//extension Person {
//    // Computed property to concatenate the first name and last name into a full name.
//    public var fullName: String {
//        // If fName or lName are optional, safely unwrap them using nil coalescing.
//        let first = firstName ?? ""
//        let last = lastName ?? ""
//        return first.isEmpty && last.isEmpty ? "Unknown Name" : "\(first) \(last)".trimmingCharacters(in: .whitespacesAndNewlines)
//    }
//
//    // If you have relationships, you can add computed properties to return typed arrays,
//    // For example, if 'orders' is a to-many relationship to an 'Order' entity, you might have:
//    // var orderArray: [Order] {
//    //     let set = orders as? Set<Order> ?? []
//    //     return set.sorted { $0.timestamp < $1.timestamp }
//    // }
//}
//
//// MARK: Generated accessors for orders
//extension Person {
//
//
//}


