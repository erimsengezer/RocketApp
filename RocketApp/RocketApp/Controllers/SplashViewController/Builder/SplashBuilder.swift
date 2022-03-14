//
//  SplashBuilder.swift
//  RocketApp
//
//  Created by Erim Şengezer on 8.03.2022.
//

import UIKit

enum SplashBuilder {
    static func generate(coordinatorProtocol: SplashCoordinatorProtocol) -> UIViewController? {
        let service: SplashServiceProtocol = SplashService()
        let repository: SplashRepositoryProtocol = SplashRepository(service: service)
        var interactor: SplashInteractorProtocol = SplashInteractor(repository: repository)
        var presenter: SplashPresenterProtocol & SplashInteractorOutputProtocol = SplashPresenter(interactor: interactor, coordinatorProtocol: coordinatorProtocol)
        let view: SplashViewProtocol = SplashViewController(presenter: presenter)
        
        presenter.view = view
        interactor.output = presenter
        
        return view as? UIViewController
    }
}
