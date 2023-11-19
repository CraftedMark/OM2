//
//  Employee+CoreDataProperties.swift
//  OM2
//
//  Created by Mark Nashed on 11/17/23.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var dateHired: Date?
    @NSManaged public var fName: String?
    @NSManaged public var hourlyRate: NSDecimalNumber?
    @NSManaged public var id: UUID?
    @NSManaged public var lName: String?
    @NSManaged public var notes: String?
    @NSManaged public var employee: NSSet?

}

// MARK: Generated accessors for employee
extension Employee {

    @objc(addEmployeeObject:)
    @NSManaged public func addToEmployee(_ value: LaborCost)

    @objc(removeEmployeeObject:)
    @NSManaged public func removeFromEmployee(_ value: LaborCost)

    @objc(addEmployee:)
    @NSManaged public func addToEmployee(_ values: NSSet)

    @objc(removeEmployee:)
    @NSManaged public func removeFromEmployee(_ values: NSSet)

}

extension Employee : Identifiable {

}
