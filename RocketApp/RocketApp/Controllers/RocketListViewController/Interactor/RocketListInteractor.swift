//
//  RocketListInteractor.swift
//  RocketApp
//
//  Created by Erim Şengezer on 8.03.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
// 

import Foundation

protocol RocketListInteractorProtocol {
    var repository: RocketListRepositoryProtocol { get }
    var output: RocketListInteractorOutputProtocol? { get set }
    
    func fetchAllRockets()
    func saveFavoriteRocket(rocket: RocketElement)
    func getAllObjectsFromCoreData() -> [RocketCoreDataModel]?
}

protocol RocketListInteractorOutputProtocol: AnyObject {
    func didGetRocketsSuccess(viewModel: RocketListViewModel)
    func didGetRocketFailure(error: Error)
    
    func didSaveFavoriteRocketSuccess()
    func didSaveFavoriteRocketFailure()
}

class RocketListInteractor: RocketListInteractorProtocol {
    
    // MARK: - Public Properties
    let repository: RocketListRepositoryProtocol
    weak var output: RocketListInteractorOutputProtocol?
    
    // MARK: - Initializer
    init(repository: RocketListRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchAllRockets() {
        repository.fetchAllRockets(success: { [weak self] response in
            let viewModel = RocketListViewModel(response: response)
            self?.output?.didGetRocketsSuccess(viewModel: viewModel)
        }, failure: { [weak self] error in
            self?.output?.didGetRocketFailure(error: error)
        })
    }
    
    func saveFavoriteRocket(rocket: RocketElement) {
        repository.saveFavoriteRocket(rocket: rocket) { [weak self] in
            self?.output?.didSaveFavoriteRocketSuccess()
        } failure: {
            self.output?.didSaveFavoriteRocketFailure()
        }

    }
    
    func getAllObjectsFromCoreData() -> [RocketCoreDataModel]? {
        return repository.getAllObjectsFromCoreData()
    }
}
