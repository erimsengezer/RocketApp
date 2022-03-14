//
//  MyFavoritesCoordinator.swift
//  RocketApp
//
//  Created by Erim Şengezer on 8.03.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
//

import Foundation

protocol MyFavoritesCoordinatorProtocol: AnyObject {
    func presentToDetailScreen(rocketItem: RocketElement)
}

class MyFavoritesCoordinator: NavigationCoordinator, MyFavoritesCoordinatorProtocol {
    override func start() {
        guard let controller = MyFavoritesBuilder.generate(coordinatorProtocol: self) else { return }
        navigationController.pushViewController(controller, animated: true)
    }
    
    func presentToDetailScreen(rocketItem: RocketElement) {
        let coordinator = RocketDetailCoordinator(presenterViewController: self.lastViewController, rocketItem: rocketItem)
        coordinate(to: coordinator)
    }
}
