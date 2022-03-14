//
//  RocketListTableViewCell.swift
//  RocketApp
//
//  Created by Erim Şengezer on 10.03.2022.
//

import UIKit
import Kingfisher
import CoreData

class RocketListTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    static let cellIdentifier = "RocketListTableViewCell"
    
    // MARK: - IBOutlets
    @IBOutlet weak private var imageViewRocketImage: UIImageView!
    @IBOutlet weak private var labelRocketName: UILabel!
    @IBOutlet weak private var imageViewFavorite: UIImageView!
    
    var favButtonPressed : (() -> ()) = {}
    
    // MARK: - Constants
    private enum Constants {
        enum Image {
            static let imageStar: UIImage? = UIImage(named: "star")
            static let imageSelectedStar: UIImage? = UIImage(named: "starSelected")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addGesture()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    private func addGesture() {
        imageViewFavorite.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(favoriteImageTapped(_:)))
        imageViewFavorite.addGestureRecognizer(gesture)
    }
    
    func configureCell(itemModel: RocketElement, isExistLocalData: Bool?, indexPath: IndexPath) {
        imageViewRocketImage.contentMode = .scaleAspectFill
        imageViewFavorite.contentMode = .scaleAspectFit
        imageViewFavorite.image = Constants.Image.imageStar
        
        if let urlString = itemModel.flickr_images?.first,
           let url = URL(string: urlString) {
            imageViewRocketImage?.kf.setImage(with: url,
                                             placeholder: nil,
                                             options: nil,
                                             completionHandler: nil)
        }
        
        if let isExistLocalData = isExistLocalData,
           isExistLocalData {
            imageViewFavorite.image = Constants.Image.imageSelectedStar
        } else {
            imageViewFavorite.image = Constants.Image.imageStar
        }
        
        if let name = itemModel.name {
            labelRocketName?.text = name
        }
    }
    
    @objc private func favoriteImageTapped(_ sender: UITapGestureRecognizer) {
        if imageViewFavorite.image == Constants.Image.imageStar {
            imageViewFavorite.image = Constants.Image.imageSelectedStar
        } else {
            imageViewFavorite.image = Constants.Image.imageStar
        }
        
        favButtonPressed()
    }
}
