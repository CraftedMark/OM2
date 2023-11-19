//
//  FoodProduct+CoreDataProperties.swift
//  OM2
//
//  Created by Mark Nashed on 11/17/23.
//
//

import Foundation
import CoreData


extension FoodProduct {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FoodProduct> {
        return NSFetchRequest<FoodProduct>(entityName: "FoodProduct")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var ingredients: String?
    @NSManaged public var labor: Double
    @NSManaged public var name: String?
    @NSManaged public var price: Double
    @NSManaged public var productDescription: String?
    @NSManaged public var ingredient: NSSet?

}

// MARK: Generated accessors for ingredient
extension FoodProduct {

    @objc(addIngredientObject:)
    @NSManaged public func addToIngredient(_ value: FoodProduct)

    @objc(removeIngredientObject:)
    @NSManaged public func removeFromIngredient(_ value: FoodProduct)

    @objc(addIngredient:)
    @NSManaged public func addToIngredient(_ values: NSSet)

    @objc(removeIngredient:)
    @NSManaged public func removeFromIngredient(_ values: NSSet)

}

extension FoodProduct : Identifiable {

}
