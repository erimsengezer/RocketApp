//
//  MyFavoritesRepository.swift
//  RocketApp
//
//  Created by Erim Şengezer on 8.03.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
// 

import Foundation

protocol MyFavoritesRepositoryProtocol {
    typealias SuccessHandler = ([RocketCoreDataModel]) -> Void
    typealias FailureHandler = () -> Void
    
    typealias SaveFavoriteSuccessHandler = () -> Void
    typealias SaveFavoriteFailureHandler = () -> Void
    
    func getAllObjectsFromCoreData(success: @escaping SuccessHandler, failure: @escaping FailureHandler)
    func saveFavoriteRocket(rocket: RocketElement,
                            success: @escaping SaveFavoriteSuccessHandler,
                            failure: @escaping SaveFavoriteFailureHandler)
}

class MyFavoritesRepository: MyFavoritesRepositoryProtocol {
    // MARK: - Properties
    let service: MyFavoritesServiceProtocol
    
    // MARK: - Initializer
    init(service: MyFavoritesServiceProtocol) {
        self.service = service
    }
    
    func getAllObjectsFromCoreData(success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        service.getAllObjectsFromCoreData { modelArray in
            success(modelArray)
        } failure: {
            failure()
        }
    }
    
    func saveFavoriteRocket(rocket: RocketElement,
                            success: @escaping SaveFavoriteSuccessHandler,
                            failure: @escaping SaveFavoriteFailureHandler) {
        service.saveFavoriteRocket(rocket: rocket) {
            success()
        } failure: {
            failure()
        }
    }
}
