//
//  SplashViewController.swift
//  RocketApp
//
//  Created by Erim Şengezer on 8.03.2022.
//

import UIKit

protocol SplashViewProtocol: AnyObject {
    var presenter: SplashPresenterProtocol { get }
    
    func startFlowMain()
}

class SplashViewController: UIViewController {
    
    // MARK: - Public Properties
    let presenter: SplashPresenterProtocol
    
    // MARK: - Private Properties
    
    // MARK: Initializers
    init(presenter: SplashPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: .main)
    }
    
    // MARK: - Lifecycle
    required init?(coder: NSCoder) {
        return nil
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension SplashViewController: SplashViewProtocol {
    func startFlowMain() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.appDelegate.startFlowMain()
        }
    }
}
