//
//  RocketDetailViewController.swift
//  RocketApp
//
//  Created by Erim Şengezer on 11.03.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
//

import UIKit
import Kingfisher

protocol RocketDetailViewProtocol: AnyObject {
    var presenter: RocketDetailPresenterProtocol { get }
    
    func configureView(rocketItem: RocketElement)
    func addGesture()
}

class RocketDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak private var labelTitle: UILabel!
    @IBOutlet weak private var imageViewRocketImage: UIImageView!
    @IBOutlet weak private var labelDescription: UILabel!
    @IBOutlet weak private var labelWikipedia: UILabel!
    
    
    // MARK: - Public Properties
    let presenter: RocketDetailPresenterProtocol
    
    // MARK: - Private Properties
    private var wikipediaUrlString: String?
    
    // MARK: Initializers
    init(presenter: RocketDetailPresenterProtocol) {
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

extension RocketDetailViewController: RocketDetailViewProtocol {
    func addGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(openWikipedia(_ :)))
        labelWikipedia.isUserInteractionEnabled = true
        labelWikipedia.addGestureRecognizer(gesture)
    }
    
    @objc private func openWikipedia(_ sender: UITapGestureRecognizer) {
        if let urlString = self.wikipediaUrlString {
            if let url = URL(string: urlString) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
    
    func configureView(rocketItem: RocketElement) {
        labelTitle.text = rocketItem.name
        labelDescription.text = rocketItem.description
        
        if let urlString = rocketItem.flickr_images?.first {
            if let url = URL(string: urlString) {
                imageViewRocketImage.kf.setImage(with: url,
                                                 placeholder: nil,
                                                 options: nil,
                                                 completionHandler: nil)
            }
        }
        
        labelWikipedia.text = rocketItem.wikipedia
        self.wikipediaUrlString = rocketItem.wikipedia
    }
}



