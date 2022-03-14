//
//  RocketListViewModel.swift
//  RocketApp
//
//  Created by Erim Şengezer on 10.03.2022.
//

import Foundation


struct RocketListViewModel {
    
    // MARK: - Private Properties
    private var response: Rocket
    private let managedContext = CoreDataService.shared.persistentContainer.viewContext
    private let coreDataManager: RocketListCoreDataManager
    
    // MARK: - Public Properties
    var numberOfItems: Int? {
        return response.count
    }
    
    var titles: [String?]? {
        return response.map({$0.name})
    }
    
    func getItemModel(indexPath: IndexPath) -> RocketElement? {
        return self.response[indexPath.row]
        
    }
    
    func isSaveCoreData(indexPath: IndexPath) -> Bool {
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
    init(response: Rocket) {
        self.response = response
        self.coreDataManager = RocketListCoreDataManager(managedContext: managedContext)
    }
}
