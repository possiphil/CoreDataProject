//
//  Singer+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Philipp Sanktjohanser on 23.12.22.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?

}

extension Singer : Identifiable {

}
