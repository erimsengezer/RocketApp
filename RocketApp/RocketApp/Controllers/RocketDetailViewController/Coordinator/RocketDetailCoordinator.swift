//
//  RocketDetailCoordinator.swift
//  RocketApp
//
//  Created by Erim Şengezer on 11.03.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
//

import UIKit

protocol RocketDetailCoordinatorProtocol: AnyObject {
    var rocketItem: RocketElement { get }
}

class RocketDetailCoordinator: PresentationCoordinator, RocketDetailCoordinatorProtocol {
    
    var rocketItem: RocketElement
    
    init(presenterViewController: UIViewController?, rocketItem: RocketElement) {
        self.rocketItem = rocketItem
        super.init(presenterViewController: presenterViewController)
    }
    
    override func start() {
        guard let controller = RocketDetailBuilder.generate(coordinatorProtocol: self, rocketItem: rocketItem) else { return }
        startPresent(targetVC: controller)
    }
}
