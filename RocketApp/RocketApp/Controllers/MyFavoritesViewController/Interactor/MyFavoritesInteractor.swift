//
//  MyFavoritesInteractor.swift
//  RocketApp
//
//  Created by Erim Şengezer on 8.03.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
// 

import Foundation

protocol MyFavoritesInteractorProtocol {
    var repository: MyFavoritesRepositoryProtocol { get }
    var output: MyFavoritesInteractorOutputProtocol? { get set }
    
    func getAllObjectsFromCoreData()
    func saveFavoriteRocket(rocket: RocketElement)
}

protocol MyFavoritesInteractorOutputProtocol: AnyObject {
    func didCoreDataSuccess(viewModel: MyFavoritesViewModel)
    func didCoreDataFailure()
    
    func didSaveFavoriteRocketSuccess(rocket: RocketElement)
    func didSaveFavoriteRocketFailure()
}

class MyFavoritesInteractor: MyFavoritesInteractorProtocol {
    
    // MARK: - Public Properties
    let repository: MyFavoritesRepositoryProtocol
    weak var output: MyFavoritesInteractorOutputProtocol?
    
    // MARK: - Initializer
    init(repository: MyFavoritesRepositoryProtocol) {
        self.repository = repository
    }
    
    func getAllObjectsFromCoreData() {
        repository.getAllObjectsFromCoreData { [weak self] modelArray in
            let viewModel = MyFavoritesViewModel(response: modelArray)
            self?.output?.didCoreDataSuccess(viewModel: viewModel)
        } failure: { [weak self] in
            self?.output?.didCoreDataFailure()
        }
    }
    
    func saveFavoriteRocket(rocket: RocketElement) {
        repository.saveFavoriteRocket(rocket: rocket) { [weak self] in
            self?.output?.didSaveFavoriteRocketSuccess(rocket: rocket)
        } failure: {
            self.output?.didSaveFavoriteRocketFailure()
        }
    }
}
