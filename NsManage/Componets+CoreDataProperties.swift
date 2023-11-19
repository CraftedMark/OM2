//
//  Componets+CoreDataProperties.swift
//  OM2
//
//  Created by Mark Nashed on 11/17/23.
//
//

import Foundation
import CoreData


extension Componets {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Componets> {
        return NSFetchRequest<Componets>(entityName: "Componets")
    }

    @NSManaged public var costOfGoods: NSDecimalNumber?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var price: Double
    @NSManaged public var productDescription: String?

}

extension Componets : Identifiable {

}
