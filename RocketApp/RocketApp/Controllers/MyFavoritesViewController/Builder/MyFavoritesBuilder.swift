//
//  MyFavoritesBuilder.swift
//  RocketApp
//
//  Created by Erim Şengezer on 8.03.2022.
//  Copyright (c) 2022 All rights reserved.[EC-2021]
// 

import UIKit

enum MyFavoritesBuilder {
    
    static func generate(coordinatorProtocol: MyFavoritesCoordinatorProtocol) -> UIViewController? {
        let managedContext = CoreDataService.shared.persistentContainer.viewContext
        let service = MyFavoritesService(coreDataManager: RocketListCoreDataManager(managedContext: managedContext))
        
        let repository: MyFavoritesRepositoryProtocol = MyFavoritesRepository(service: service)
        var interactor: MyFavoritesInteractorProtocol = MyFavoritesInteractor(repository: repository)
        var presenter: MyFavoritesPresenterProtocol & MyFavoritesInteractorOutputProtocol = MyFavoritesPresenter(interactor: interactor,
                                                                                                                 coordinatorProtocol: coordinatorProtocol)
        let view: MyFavoritesViewProtocol = MyFavoritesViewController(presenter: presenter)
        
        presenter.view = view
        interactor.output = presenter
        
        return view as? UIViewController
    }
}
