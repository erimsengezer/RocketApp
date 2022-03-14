//
//  MyFavoritesService.swift
//  RocketApp
//
//  Created by Erim Şengezer on 8.03.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
// 

import Foundation

protocol MyFavoritesServiceProtocol: AnyObject {
    typealias SuccessHandler = ([RocketCoreDataModel]) -> Void
    typealias FailureHandler = () -> Void
    typealias SaveFavoriteSuccessHandler = () -> Void
    typealias SaveFavoriteFailureHandler = () -> Void
    
    func getAllObjectsFromCoreData(success: @escaping SuccessHandler, failure: @escaping FailureHandler)
    func saveFavoriteRocket(rocket: RocketElement,
                            success: @escaping SaveFavoriteSuccessHandler,
                            failure: @escaping SaveFavoriteFailureHandler)
}

class MyFavoritesService: MyFavoritesServiceProtocol {
    
    let coreDataManager: RocketListCoreDataManager
    
    init(coreDataManager: RocketListCoreDataManager) {
        self.coreDataManager = coreDataManager
    }
    
    func getAllObjectsFromCoreData(success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        if let data = coreDataManager.fetchAllRocketsData() {
            success(data)
        } else {
            failure()
        }
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
}
