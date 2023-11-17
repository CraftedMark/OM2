//
//  Person+CoreDataClass.swift
//  OM2
//
//  Created by Mark Nashed on 11/17/23.
//
//

// Person+CoreDataClass.swift

// Person+CoreDataClass.swift

import Foundation
import CoreData

@objc(Person)
public class Person: NSManagedObject {
    // Custom logic or computed properties go here

    public var fullName: String {
        let first = firstName ?? ""
        let last = lastName ?? ""
        return first.isEmpty && last.isEmpty ? "Unknown Name" : "\(first) \(last)".trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
