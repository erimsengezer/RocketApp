//
//  MyFavoritesTableViewDelegate.swift
//  RocketApp
//
//  Created by Erim Şengezer on 11.03.2022.
//

import UIKit

protocol MyFavoritesTableViewDelegateOutput: AnyObject {
    func didSelectRow(indexPath: IndexPath)
    func didSelectFavoriteItem(rocketItem: RocketElement)
}

class MyFavoritesTableViewDelegate: NSObject {
    weak var output: MyFavoritesTableViewDelegateOutput?
}

extension MyFavoritesTableViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output?.didSelectRow(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
