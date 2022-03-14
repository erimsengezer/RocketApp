//
//  RocketDetailBuilder.swift
//  RocketApp
//
//  Created by Erim Şengezer on 11.03.2022.
//  Copyright (c) 2022 All rights reserved.[EC-2021]
// 

import UIKit

enum RocketDetailBuilder {
    
    static func generate(coordinatorProtocol: RocketDetailCoordinatorProtocol, rocketItem: RocketElement) -> UIViewController? {
        let service: RocketDetailServiceProtocol = RocketDetailService()
        let repository: RocketDetailRepositoryProtocol = RocketDetailRepository(service: service)
        var interactor: RocketDetailInteractorProtocol = RocketDetailInteractor(repository: repository,
                                                                                rocketItem: rocketItem)
        var presenter: RocketDetailPresenterProtocol & RocketDetailInteractorOutputProtocol = RocketDetailPresenter(interactor: interactor,
                                                                                                                    coordinatorProtocol: coordinatorProtocol)
        let view: RocketDetailViewProtocol = RocketDetailViewController(presenter: presenter)
        
        presenter.view = view
        interactor.output = presenter
        
        return view as? UIViewController
    }
}
