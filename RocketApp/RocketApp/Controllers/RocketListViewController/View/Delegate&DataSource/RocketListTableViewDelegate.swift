//
//  RocketListTableViewDelegate.swift
//  RocketApp
//
//  Created by Erim Şengezer on 10.03.2022.
//

import UIKit

protocol RocketListTableViewDelegateOutput: AnyObject {
    func didSelectRow(indexPath: IndexPath)
    func didSelectFavoriteItem(rocketItem: RocketElement)
}

class RocketListTableViewDelegate: NSObject {
    
    weak var output: RocketListTableViewDelegateOutput?
}

extension RocketListTableViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output?.didSelectRow(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
