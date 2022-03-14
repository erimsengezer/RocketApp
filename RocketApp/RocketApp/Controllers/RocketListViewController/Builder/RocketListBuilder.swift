//
//  RocketListBuilder.swift
//  RocketApp
//
//  Created by Erim Şengezer on 8.03.2022.
//  Copyright (c) 2022 All rights reserved.[EC-2021]
// 

import UIKit
import Moya

enum RocketListBuilder {
    static func generate(coordinatorProtocol: RocketListCoordinatorProtocol) -> UIViewController? {
        
        let managedContext = CoreDataService.shared.persistentContainer.viewContext
        let networkManager = RocketNetworkManager(rocketProvider: MoyaProvider<RocketAPI>())
        
        let service: RocketListServiceProtocol = RocketListService(coreDataManager: RocketListCoreDataManager(managedContext: managedContext),
                                                                   networkManager: networkManager)
        let repository: RocketListRepositoryProtocol = RocketListRepository(service: service)
        var interactor: RocketListInteractorProtocol = RocketListInteractor(repository: repository)
        var presenter: RocketListPresenterProtocol & RocketListInteractorOutputProtocol = RocketListPresenter(interactor: interactor,
                                                                                                              coordinatorProtocol: coordinatorProtocol)
        let view: RocketListViewProtocol = RocketListViewController(presenter: presenter)
        
        presenter.view = view
        interactor.output = presenter
        
        return view as? UIViewController
    }
}
