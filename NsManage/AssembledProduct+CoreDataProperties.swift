//
//  AssembledProduct+CoreDataProperties.swift
//  OM2
//
//  Created by Mark Nashed on 11/17/23.
//
//

import Foundation
import CoreData


extension AssembledProduct {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AssembledProduct> {
        return NSFetchRequest<AssembledProduct>(entityName: "AssembledProduct")
    }

    @NSManaged public var componetName: String?
    @NSManaged public var componeyQty: Int16
    @NSManaged public var dose: Double
    @NSManaged public var flavor: String?
    @NSManaged public var id: UUID?
    @NSManaged public var package: String?
    @NSManaged public var price: NSDecimalNumber?
    @NSManaged public var componets: NSSet?
    @NSManaged public var ingredient: NSSet?

}

// MARK: Generated accessors for componets
extension AssembledProduct {

    @objc(addComponetsObject:)
    @NSManaged public func addToComponets(_ value: AssembledProduct)

    @objc(removeComponetsObject:)
    @NSManaged public func removeFromComponets(_ value: AssembledProduct)

    @objc(addComponets:)
    @NSManaged public func addToComponets(_ values: NSSet)

    @objc(removeComponets:)
    @NSManaged public func removeFromComponets(_ values: NSSet)

}

// MARK: Generated accessors for ingredient
extension AssembledProduct {

    @objc(addIngredientObject:)
    @NSManaged public func addToIngredient(_ value: AssembledProduct)

    @objc(removeIngredientObject:)
    @NSManaged public func removeFromIngredient(_ value: AssembledProduct)

    @objc(addIngredient:)
    @NSManaged public func addToIngredient(_ values: NSSet)

    @objc(removeIngredient:)
    @NSManaged public func removeFromIngredient(_ values: NSSet)

}

extension AssembledProduct : Identifiable {

}
