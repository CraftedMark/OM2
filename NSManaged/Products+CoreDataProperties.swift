//
//  Products+CoreDataProperties.swift
//  OM2
//
//  Created by Mark Nashed on 11/17/23.
//
//

import Foundation
import CoreData


extension Products {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Products> {
        return NSFetchRequest<Products>(entityName: "Products")
    }

    @NSManaged public var costOfGoods: NSDecimalNumber?
    @NSManaged public var dose: Int16
    @NSManaged public var flavor: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var packaging: String?
    @NSManaged public var productDescription: String?
    @NSManaged public var qty: Int16
    @NSManaged public var salePrice: NSDecimalNumber?
    @NSManaged public var size: Int16
    @NSManaged public var unit: String?
    @NSManaged public var orderedItem: NSSet?

}

// MARK: Generated accessors for orderedItem
extension Products {

    @objc(addOrderedItemObject:)
    @NSManaged public func addToOrderedItem(_ value: Products)

    @objc(removeOrderedItemObject:)
    @NSManaged public func removeFromOrderedItem(_ value: Products)

    @objc(addOrderedItem:)
    @NSManaged public func addToOrderedItem(_ values: NSSet)

    @objc(removeOrderedItem:)
    @NSManaged public func removeFromOrderedItem(_ values: NSSet)

}

extension Products : Identifiable {

}
