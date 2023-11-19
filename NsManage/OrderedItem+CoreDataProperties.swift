//
//  OrderedItem+CoreDataProperties.swift
//  OM2
//
//  Created by Mark Nashed on 11/17/23.
//
//

import Foundation
import CoreData

extension OrderedItem {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<OrderedItem> {
        return NSFetchRequest<OrderedItem>(entityName: "OrderedItem")
    }

    @NSManaged public var activeIngredient: String?
    @NSManaged public var dose: String?
    @NSManaged public var flavor: String?
    @NSManaged public var id: UUID? // Ensure this is marked as the unique identifier in your Core Data model
    @NSManaged public var notes: String?
    @NSManaged public var name: String?
    @NSManaged public var packaging: String?
    @NSManaged public var price: Double // Consider storing currency values as NSDecimalNumber for precision
    @NSManaged public var productName: String?
    @NSManaged public var quantity: Int16
    @NSManaged public var product: Products?
}

// Since OrderedItem is a Core Data entity, it's automatically Identifiable through its NSManagedObjectID.
// You can remove the Identifiable conformance if 'id' is being used as the unique identifier in your Core Data model.
// If you need to use 'id' as the identifier in SwiftUI, make sure it is non-optional or provide default values.
