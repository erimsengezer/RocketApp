//
//  RocketListRepository.swift
//  RocketApp
//
//  Created by Erim Şengezer on 8.03.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
// 

import Foundation

protocol RocketListRepositoryProtocol {
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

class RocketListRepository: RocketListRepositoryProtocol {
    // MARK: - Properties
    let service: RocketListServiceProtocol
    
    // MARK: - Initializer
    init(service: RocketListServiceProtocol) {
        self.service = service
    }
    
    func fetchAllRockets(success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        service.fetchAllRockets(success: { response in
            success(response)
        }, failure: failure)
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
    
    func getAllObjectsFromCoreData() -> [RocketCoreDataModel]? {
        return service.getAllObjectsFromCoreData()
    }
}
