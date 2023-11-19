//
//  LaborCost+CoreDataProperties.swift
//  OM2
//
//  Created by Mark Nashed on 11/17/23.
//
//

import Foundation
import CoreData


extension LaborCost {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LaborCost> {
        return NSFetchRequest<LaborCost>(entityName: "LaborCost")
    }

    @NSManaged public var employee: String?
    @NSManaged public var foodProduct: String?
    @NSManaged public var hourlyRate: NSDecimalNumber?
    @NSManaged public var hoursPerBatch: NSDecimalNumber?
    @NSManaged public var laborCost: Employee?

}

extension LaborCost : Identifiable {

}
