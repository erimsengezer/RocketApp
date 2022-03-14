//
//  MyFavoritesPresenter.swift
//  RocketApp
//
//  Created by Erim Şengezer on 8.03.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
//
import Foundation

protocol MyFavoritesPresenterProtocol {
    var view: MyFavoritesViewProtocol? { get set }
    var interactor: MyFavoritesInteractorProtocol { get }
    var coordinator: MyFavoritesCoordinatorProtocol { get }
    
    var viewModel: MyFavoritesViewModel? { get }
    
    func viewDidLoad()
    func viewWillAppear()
    
    func saveFavoriteRocket(rocket: RocketElement)
    func presentToDetailScreen(rocketItem: RocketElement)
}

class MyFavoritesPresenter: MyFavoritesPresenterProtocol {
    
    // MARK: - Public Properties
    let interactor: MyFavoritesInteractorProtocol
    let coordinator: MyFavoritesCoordinatorProtocol
    weak var view: MyFavoritesViewProtocol?
    
    var viewModel: MyFavoritesViewModel?
    
    // MARK: - Initializer
    init(interactor: MyFavoritesInteractorProtocol, coordinatorProtocol: MyFavoritesCoordinatorProtocol) {
        self.interactor = interactor
        self.coordinator = coordinatorProtocol
    }
    
    func viewDidLoad() {
        view?.configureTableView()
        view?.configureNavigationBar()
        interactor.getAllObjectsFromCoreData()
    }
    
    func viewWillAppear() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(eventForFavorite),
                                               name: NSNotification.Name(rawValue: "eventForFavorite"),
                                               object: nil)
    }
    
    @objc private func eventForFavorite() {
        interactor.getAllObjectsFromCoreData()
    }
    
    func saveFavoriteRocket(rocket: RocketElement) {
        interactor.saveFavoriteRocket(rocket: rocket)
    }
    
    func presentToDetailScreen(rocketItem: RocketElement) {
        coordinator.presentToDetailScreen(rocketItem: rocketItem)
    }
}


extension MyFavoritesPresenter: MyFavoritesInteractorOutputProtocol {
    
    func didCoreDataSuccess(viewModel: MyFavoritesViewModel) {
        self.viewModel = viewModel
        view?.refresh()
    }
    
    func didCoreDataFailure() {
        print("Fetch fail")
    }
    
    func didSaveFavoriteRocketSuccess(rocket: RocketElement) {
        print("Saved Success")
    }
    
    func didSaveFavoriteRocketFailure() {
        print("Saved failure")
    }
}

