//
//  SplashInteractor.swift
//  RocketApp
//
//  Created by Erim Şengezer on 8.03.2022.
//

import Foundation

protocol SplashInteractorProtocol {
    var repository: SplashRepositoryProtocol { get }
    var output: SplashInteractorOutputProtocol? { get set }
}

protocol SplashInteractorOutputProtocol: AnyObject {

}

class SplashInteractor: SplashInteractorProtocol {
    
    // MARK: - Public Properties
    let repository: SplashRepositoryProtocol
    weak var output: SplashInteractorOutputProtocol?
    
    // MARK: - Initializer
    init(repository: SplashRepositoryProtocol) {
        self.repository = repository
    }
}
