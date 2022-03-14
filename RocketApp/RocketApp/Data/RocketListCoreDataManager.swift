//
//  RocketListCoreDataManager.swift
//  RocketApp
//
//  Created by Erim Şengezer on 11.03.2022.
//

import Foundation
import CoreData

class RocketListCoreDataManager: BaseCoreDataManager<RocketCoreDataModel> {
    
    let notificationCenter = NotificationCenter.default
    
    func fetchAllRocketsData() -> [RocketCoreDataModel]? {
        return getAllObjects()
    }
    
    func createOrDeleteFavoriteRocket(parameters: RocketElement, success: @escaping () -> Void, failure: @escaping () -> Void) {
        guard let paramID = parameters.id else { return }
        
        if isExistModel(id: paramID) {
            let isDeleted = deleteFavoriteRocket(rocket: parameters)
            
            if isDeleted {
                success()
                self.notificationCenter.post(name: NSNotification.Name(rawValue: "eventForFavorite"), object: nil)
            } else {
                failure()
            }

        } else {
            let newRocket = RocketCoreDataModel(context: self.managedContext)
            newRocket.id = parameters.id
            newRocket.name = parameters.name
            newRocket.rocketImageUrlString = parameters.flickr_images?.first
            newRocket.rocketDescription = parameters.description
            newRocket.wikipediaUrlString = parameters.wikipedia

            let isSaved = saveContext()
            
            if isSaved {
                success()
                self.notificationCenter.post(name: NSNotification.Name(rawValue: "eventForFavorite"), object: nil)
            } else {
                failure()
            }
        }
    }
    
    func deleteFavoriteRocket(rocket: RocketElement) -> Bool {
        guard let rocketId = rocket.id else { return false }
        
        return deleteObjects(predicate: NSPredicate(format: "id == %@", rocketId))
    }
    
    func isExistModel(id: String) -> Bool {
        let predicate = NSPredicate(format: "id == %@", id)
        return (getAllObjects(with: predicate)?.count ?? 0) > 0
    }
}
