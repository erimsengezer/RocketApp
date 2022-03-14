//
//  SplashPresenter.swift
//  RocketApp
//
//  Created by Erim Şengezer on 8.03.2022.
//

import Foundation

protocol SplashPresenterProtocol {
    var view: SplashViewProtocol? { get set }
    var interactor: SplashInteractorProtocol { get }
    var coordinator: SplashCoordinatorProtocol { get }
    
    func viewDidLoad()
}

class SplashPresenter: SplashPresenterProtocol {
    
    // MARK: - Public Properties
    let interactor: SplashInteractorProtocol
    let coordinator: SplashCoordinatorProtocol
    weak var view: SplashViewProtocol?
    
    // MARK: - Initializer
    init(interactor: SplashInteractorProtocol, coordinatorProtocol: SplashCoordinatorProtocol) {
        self.interactor = interactor
        self.coordinator = coordinatorProtocol
    }
    
    func viewDidLoad() {
        view?.startFlowMain()
    }
    
    func viewWillAppear() {}
}


extension SplashPresenter: SplashInteractorOutputProtocol {
    
}
