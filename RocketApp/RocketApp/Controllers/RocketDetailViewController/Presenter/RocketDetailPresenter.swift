//
//  RocketDetailPresenter.swift
//  RocketApp
//
//  Created by Erim Şengezer on 11.03.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
//
import Foundation

protocol RocketDetailPresenterProtocol {
    var view: RocketDetailViewProtocol? { get set }
    var interactor: RocketDetailInteractorProtocol { get }
    var coordinator: RocketDetailCoordinatorProtocol { get }
    
    func viewDidLoad()
}

class RocketDetailPresenter: RocketDetailPresenterProtocol {
    
    // MARK: - Public Properties
    let interactor: RocketDetailInteractorProtocol
    let coordinator: RocketDetailCoordinatorProtocol
    weak var view: RocketDetailViewProtocol?
    
    // MARK: - Initializer
    init(interactor: RocketDetailInteractorProtocol, coordinatorProtocol: RocketDetailCoordinatorProtocol) {
        self.interactor = interactor
        self.coordinator = coordinatorProtocol
    }
    
    func viewDidLoad() {
        view?.configureView(rocketItem: interactor.rocketItem)
        view?.addGesture()
    }
    
    func viewWillAppear() {}
}


extension RocketDetailPresenter: RocketDetailInteractorOutputProtocol {

}

