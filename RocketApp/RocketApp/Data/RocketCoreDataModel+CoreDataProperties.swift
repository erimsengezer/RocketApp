//
//  RocketCoreDataModel+CoreDataProperties.swift
//  RocketApp
//
//  Created by Erim Şengezer on 11.03.2022.
//
//

import Foundation
import CoreData


extension RocketCoreDataModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RocketCoreDataModel> {
        return NSFetchRequest<RocketCoreDataModel>(entityName: "RocketCoreDataModel")
    }
    
    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var rocketDescription: String?
    @NSManaged public var rocketImageUrlString: String?
    @NSManaged public var wikipediaUrlString: String?

}

extension RocketCoreDataModel : Identifiable {

}
