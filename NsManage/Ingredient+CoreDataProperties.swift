//
//  Ingredient+CoreDataProperties.swift
//  OM2
//
//  Created by Mark Nashed on 11/17/23.
//
//

import Foundation
import CoreData


extension Ingredient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredient> {
        return NSFetchRequest<Ingredient>(entityName: "Ingredient")
    }

    @NSManaged public var amountPerBatch: NSDecimalNumber?
    @NSManaged public var costPerUnit: NSDecimalNumber?
    @NSManaged public var foodProduct: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var unit: String?
    @NSManaged public var foodProducts: NSSet?

}

// MARK: Generated accessors for foodProducts
extension Ingredient {

    @objc(addFoodProductsObject:)
    @NSManaged public func addToFoodProducts(_ value: Ingredient)

    @objc(removeFoodProductsObject:)
    @NSManaged public func removeFromFoodProducts(_ value: Ingredient)

    @objc(addFoodProducts:)
    @NSManaged public func addToFoodProducts(_ values: NSSet)

    @objc(removeFoodProducts:)
    @NSManaged public func removeFromFoodProducts(_ values: NSSet)

}

extension Ingredient : Identifiable {

}
