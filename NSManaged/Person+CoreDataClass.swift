//
//  Person+CoreDataClass.swift
//  OM2
//
//  Created by Mark Nashed on 11/17/23.
//
//

// Person+CoreDataClass.swift

import Foundation
import CoreData

@objc(Person)
public class Person: NSManagedObject {
    // Custom logic or computed properties go here

    public var fullName: String {
        let first = fName ?? ""
        let last = lName ?? ""
        return first.isEmpty && last.isEmpty ? "Unknown Name" : "\(first) \(last)".trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
