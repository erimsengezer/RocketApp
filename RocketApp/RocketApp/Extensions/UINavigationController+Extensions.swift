//
//  UINavigationController+Extensions.swift
//  RocketApp
//
//  Created by Erim Şengezer on 8.03.2022.
//

import UIKit

extension UINavigationController {
    
    var lastViewController: UIViewController? {
        return viewControllers.last
    }
    
    func setRootViewController(viewController: UIViewController) {
        self.viewControllers = [viewController]
    }
}
