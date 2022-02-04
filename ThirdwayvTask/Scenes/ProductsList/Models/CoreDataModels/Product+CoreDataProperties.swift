//
//  Product+CoreDataProperties.swift
//  ThirdwayvTask
//
//  Created by Ahmed Abd Elaziz on 04/02/2022.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var price: Int16
    @NSManaged public var title: String?
    @NSManaged public var image: Data?

}

extension Product : Identifiable {

}
