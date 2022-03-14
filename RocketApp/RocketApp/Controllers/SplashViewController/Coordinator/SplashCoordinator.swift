//
//  SplashCoordinator.swift
//  RocketApp
//
//  Created by Erim Şengezer on 8.03.2022.
//

import Foundation

protocol SplashCoordinatorProtocol: AnyObject {
    
}

class SplashCoordinator: RootableCoordinator, SplashCoordinatorProtocol {
    override func start() {
        let controller = SplashBuilder.generate(coordinatorProtocol: self)
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
}
