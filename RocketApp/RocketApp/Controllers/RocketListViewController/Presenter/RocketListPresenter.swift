//
//  RocketListPresenter.swift
//  RocketApp
//
//  Created by Erim Şengezer on 8.03.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
//
import Foundation

protocol RocketListPresenterProtocol {
    var view: RocketListViewProtocol? { get set }
    var interactor: RocketListInteractorProtocol { get }
    var coordinator: RocketListCoordinatorProtocol { get }
    
    func viewDidLoad()
    func viewWillAppear()
    var viewModel: RocketListViewModel? { get }
    
    func presentToDetailScreen(rocketItem: RocketElement)
    func saveFavoriteRocket(rocket: RocketElement)
}

class RocketListPresenter: RocketListPresenterProtocol {
    
    // MARK: - Public Properties
    let interactor: RocketListInteractorProtocol
    let coordinator: RocketListCoordinatorProtocol
    weak var view: RocketListViewProtocol?
    
    var viewModel: RocketListViewModel?
    
    // MARK: - Initializer
    init(interactor: RocketListInteractorProtocol, coordinatorProtocol: RocketListCoordinatorProtocol) {
        self.interactor = interactor
        self.coordinator = coordinatorProtocol
    }
    
    func viewDidLoad() {
        fetchAllRockets()
        view?.configureTableView()
        view?.configureNavigationBar()
        let _ = interactor.getAllObjectsFromCoreData()
    }
    
    func fetchAllRockets() {
        interactor.fetchAllRockets()
    }
    
    func viewWillAppear() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(eventForFavorite),
                                               name: NSNotification.Name(rawValue: "eventForFavorite"),
                                               object: nil)
    }
    
    @objc private func eventForFavorite() {
        interactor.fetchAllRockets()
    }
    
    func presentToDetailScreen(rocketItem: RocketElement) {
        coordinator.presentToDetailScreen(rocketItem: rocketItem)
    }
    
    func saveFavoriteRocket(rocket: RocketElement) {
        interactor.saveFavoriteRocket(rocket: rocket)
    }
}


extension RocketListPresenter: RocketListInteractorOutputProtocol {
    
    func didGetRocketsSuccess(viewModel: RocketListViewModel) {
        self.viewModel = viewModel
        view?.refresh()
    }
    
    func didGetRocketFailure(error: Error) {
        print(error.localizedDescription)
    }
    
    func didSaveFavoriteRocketSuccess() {
        print("Saved success")
    }
    
    func didSaveFavoriteRocketFailure() {
        print("Saved failure")
    }
}

