//
//  Candy+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Philipp Sanktjohanser on 23.12.22.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?

}

extension Candy : Identifiable {

}
