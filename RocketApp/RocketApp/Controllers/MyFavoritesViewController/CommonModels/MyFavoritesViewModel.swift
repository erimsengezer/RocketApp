//
//  MyFavoritesViewModel.swift
//  RocketApp
//
//  Created by Erim Şengezer on 11.03.2022.
//

import Foundation

struct MyFavoritesViewModel {
    // MARK: - Private Properties
    private var response: [RocketCoreDataModel]
    private let managedContext = CoreDataService.shared.persistentContainer.viewContext
    private let coreDataManager: RocketListCoreDataManager
    
    // MARK: - Public Properties
    var numberOfItems: Int? {
        return response.count
    }
    
    var titles: [String?]? {
        return response.map({$0.name})
    }
    
    func getItemModel(indexPath: IndexPath) -> RocketCoreDataModel? {
        return self.response[indexPath.row]
    }
    
    func createItemModelToCoreDataModel(coreDataModel: RocketCoreDataModel) -> RocketElement {
        let id = coreDataModel.id
        let name = coreDataModel.name
        let description = coreDataModel.rocketDescription
        let wikipedia = coreDataModel.wikipediaUrlString
        var imageUrlArray = [String]([])
        if let imageUrlString = coreDataModel.rocketImageUrlString {
            imageUrlArray.append(imageUrlString)
        }
        
        let rocket = RocketElement(flickr_images: imageUrlArray,
                      name: name,
                      wikipedia: wikipedia,
                      description: description,
                      id: id)
        
        return rocket
    }
    
    func isExistLocalData(indexPath: IndexPath) -> Bool {
        let itemModel = getItemModel(indexPath: indexPath)
        
        if let itemModelId = itemModel?.id {
            if coreDataManager.isExistModel(id: itemModelId) {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    // MARK: - Initializer
    init(response: [RocketCoreDataModel]) {
        self.response = response
        self.coreDataManager = RocketListCoreDataManager(managedContext: managedContext)
    }
}
