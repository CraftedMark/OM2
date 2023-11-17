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
    @NSManaged public var id: UUID?
    @NSManaged public var notes: String?
    @NSManaged public var packaging: String?
    @NSManaged public var price: Double
    @NSManaged public var productName: String?
    @NSManaged public var quantity: Int16

}

extension OrderedItem : Identifiable {

}
