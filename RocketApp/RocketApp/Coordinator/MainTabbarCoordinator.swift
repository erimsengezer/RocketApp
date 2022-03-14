//
//  MainTabbarCoordinator.swift
//  RocketApp
//
//  Created by Erim Şengezer on 8.03.2022.
//

import UIKit

class MainTabbarCoordinator: RootableCoordinator {

    private lazy var mainTabbarController: MainTabBarController = {
        return MainTabBarController()
    }()

    override func start() {
        let rocketListNavigationController = UINavigationController()
        rocketListNavigationController.tabBarItem.title = "Rocket List"
        let rocketListCoordinator = RocketListCoordinator(navigationController: rocketListNavigationController)
        
        let favoriteRocketsNavigationController = UINavigationController()
        favoriteRocketsNavigationController.tabBarItem.title = "My Favorites"
        let favoriteRocketsCoordinator = MyFavoritesCoordinator(navigationController: favoriteRocketsNavigationController)
        
        mainTabbarController.viewControllers = [rocketListNavigationController, favoriteRocketsNavigationController]

        window?.rootViewController = mainTabbarController
        window?.makeKeyAndVisible()


        // Coordinate to first controllers for tabs
        coordinate(to: rocketListCoordinator)
        coordinate(to: favoriteRocketsCoordinator)
    }
}

