//
//  RocketDetailInteractor.swift
//  RocketApp
//
//  Created by Erim Şengezer on 11.03.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
// 

import Foundation

protocol RocketDetailInteractorProtocol {
    var repository: RocketDetailRepositoryProtocol { get }
    var output: RocketDetailInteractorOutputProtocol? { get set }
    
    var rocketItem: RocketElement { get }
}

protocol RocketDetailInteractorOutputProtocol: AnyObject {
}

class RocketDetailInteractor: RocketDetailInteractorProtocol {
    var rocketItem: RocketElement
    
    // MARK: - Public Properties
    let repository: RocketDetailRepositoryProtocol
    weak var output: RocketDetailInteractorOutputProtocol?
    
    // MARK: - Initializer
    init(repository: RocketDetailRepositoryProtocol, rocketItem: RocketElement) {
        self.repository = repository
        self.rocketItem = rocketItem
    }
}
