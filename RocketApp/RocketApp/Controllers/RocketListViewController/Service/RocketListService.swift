//
//  RocketListService.swift
//  RocketApp
//
//  Created by Erim Şengezer on 8.03.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
// 

import Foundation
import Moya
import CoreData

protocol RocketListServiceProtocol: AnyObject {
    typealias SuccessHandler = (Rocket) -> Void
    typealias FailureHandler = (Error) -> Void
    
    typealias SaveFavoriteSuccessHandler = () -> Void
    typealias SaveFavoriteFailureHandler = () -> Void
    
    func fetchAllRockets(success: @escaping SuccessHandler, failure: @escaping FailureHandler)
    func saveFavoriteRocket(rocket: RocketElement,
                            success: @escaping SaveFavoriteSuccessHandler,
                            failure: @escaping SaveFavoriteFailureHandler)
    
    func getAllObjectsFromCoreData() -> [RocketCoreDataModel]?
}

class RocketListService: RocketListServiceProtocol {
    
    
    let networkManager: RocketNetworkManager
    let coreDataManager: RocketListCoreDataManager
    
    init(coreDataManager: RocketListCoreDataManager, networkManager: RocketNetworkManager) {
        self.networkManager = networkManager
        self.coreDataManager = coreDataManager
    }
    
    func fetchAllRockets(success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        networkManager.getAllRockets(completion: { result in
            switch result {
            case .success(let rocketResponse):
                success(rocketResponse)
            case .failure(let error):
                failure(error)
            }
        })
    }
    
    func saveFavoriteRocket(rocket: RocketElement,
                            success: @escaping SaveFavoriteSuccessHandler,
                            failure: @escaping SaveFavoriteFailureHandler) {
        coreDataManager.createOrDeleteFavoriteRocket(parameters: rocket) {
            success()
        } failure: {
            failure()
        }
    }
    
    func filterById(id: String) -> Bool {
        if coreDataManager.isExistModel(id: id) {
            return true
        } else {
            return false
        }
    }
    
    func getAllObjectsFromCoreData() -> [RocketCoreDataModel]? {
        return coreDataManager.fetchAllRocketsData()
    }
}
