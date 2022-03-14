//
//  MainTabbarController.swift
//  RocketApp
//
//  Created by Erim Şengezer on 8.03.2022.
//

import UIKit

enum MainTabbarItemPosition: Int {
    case listRocketScreen = 0
    case favoritesScreen = 1
    case none = -1
}

final class MainTabBarController: UITabBarController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func changeTabbarItemController(position: MainTabbarItemPosition) {
        self.selectedIndex = position.rawValue
    }
}
