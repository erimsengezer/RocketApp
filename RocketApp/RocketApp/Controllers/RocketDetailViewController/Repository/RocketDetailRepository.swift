//
//  RocketDetailRepository.swift
//  RocketApp
//
//  Created by Erim Şengezer on 11.03.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
// 

import Foundation

protocol RocketDetailRepositoryProtocol {
    
}

class RocketDetailRepository: RocketDetailRepositoryProtocol {
    // MARK: - Properties
    let service: RocketDetailServiceProtocol
    
    // MARK: - Initializer
    init(service: RocketDetailServiceProtocol) {
        self.service = service
    }
}
