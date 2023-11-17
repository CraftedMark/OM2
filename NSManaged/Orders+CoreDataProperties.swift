//
//  Orders+CoreDataProperties.swift
//  OM2
//
//  Created by Mark Nashed on 11/17/23.
//
//

import Foundation
import CoreData


extension Orders {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Orders> {
        return NSFetchRequest<Orders>(entityName: "Orders")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var orderCompletionDate: Date?
    @NSManaged public var orderDate: Date?
    @NSManaged public var orderTotal: NSDecimalNumber?
    @NSManaged public var paidAmount: NSDecimalNumber?
    @NSManaged public var customer: NSSet?
    @NSManaged public var orderedItem: NSSet?
    @NSManaged public var person: Orders?

}

// MARK: Generated accessors for customer
extension Orders {

    @objc(addCustomerObject:)
    @NSManaged public func addToCustomer(_ value: Orders)

    @objc(removeCustomerObject:)
    @NSManaged public func removeFromCustomer(_ value: Orders)

    @objc(addCustomer:)
    @NSManaged public func addToCustomer(_ values: NSSet)

    @objc(removeCustomer:)
    @NSManaged public func removeFromCustomer(_ values: NSSet)

}

// MARK: Generated accessors for orderedItem
extension Orders {

    @objc(addOrderedItemObject:)
    @NSManaged public func addToOrderedItem(_ value: Orders)

    @objc(removeOrderedItemObject:)
    @NSManaged public func removeFromOrderedItem(_ value: Orders)

    @objc(addOrderedItem:)
    @NSManaged public func addToOrderedItem(_ values: NSSet)

    @objc(removeOrderedItem:)
    @NSManaged public func removeFromOrderedItem(_ values: NSSet)

}

extension Orders : Identifiable {

}
