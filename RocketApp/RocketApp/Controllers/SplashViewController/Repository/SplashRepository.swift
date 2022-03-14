//
//  SplashRepository.swift
//  RocketApp
//
//  Created by Erim Şengezer on 8.03.2022.
//

import Foundation

protocol SplashRepositoryProtocol {
    
}

class SplashRepository: SplashRepositoryProtocol {
    
    // MARK: - Properties
    let service: SplashServiceProtocol
    
    // MARK: - Initializer
    init(service: SplashServiceProtocol) {
        self.service = service
    }
}
