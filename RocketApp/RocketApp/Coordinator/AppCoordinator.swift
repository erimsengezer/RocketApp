//
//  AppCoordinator.swift
//  RocketApp
//
//  Created by Erim Şengezer on 8.03.2022.
//

import UIKit

protocol AppCoordinatorFlow: AnyObject {
    func startFlowMain()
}

class AppCoordinator: RootableCoordinator, AppCoordinatorFlow {

    override func start() {
        let splashCoordinator = SplashCoordinator(window: self.window)
        coordinate(to: splashCoordinator)
    }

    func startFlowMain() {
        let tabbarCoordinator = MainTabbarCoordinator(window: self.window)
        coordinate(to: tabbarCoordinator)
    }
}

