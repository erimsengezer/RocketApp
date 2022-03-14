//
//  RocketListCoordinator.swift
//  RocketApp
//
//  Created by Erim Şengezer on 8.03.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
//

import Foundation

protocol RocketListCoordinatorProtocol: AnyObject {
    func presentToDetailScreen(rocketItem: RocketElement)
}

class RocketListCoordinator: NavigationCoordinator, RocketListCoordinatorProtocol {
    override func start() {
        guard let controller = RocketListBuilder.generate(coordinatorProtocol: self) else { return }
        navigationController.pushViewController(controller, animated: true)
    }
    
    func presentToDetailScreen(rocketItem: RocketElement) {
        let coordinator = RocketDetailCoordinator(presenterViewController: self.lastViewController, rocketItem: rocketItem)
        coordinate(to: coordinator)
    }
}
