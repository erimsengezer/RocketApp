//
//  RocketListTableViewDataSource.swift
//  RocketApp
//
//  Created by Erim Şengezer on 10.03.2022.
//

import UIKit

class RocketListTableViewDataSource: NSObject {
    private var viewModel: RocketListViewModel?
    weak var output: RocketListTableViewDelegateOutput?
    
    func update(viewModel: RocketListViewModel) {
        self.viewModel = viewModel
    }
}

extension RocketListTableViewDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfItems ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:
                                                        RocketListTableViewCell.cellIdentifier, for: indexPath) as? RocketListTableViewCell,
              let itemModel = viewModel?.getItemModel(indexPath: indexPath) else { return UITableViewCell() }

        let isExistLocalData = viewModel?.isSaveCoreData(indexPath: indexPath)
        
        cell.configureCell(itemModel: itemModel, isExistLocalData: isExistLocalData, indexPath: indexPath)
        
        cell.favButtonPressed = {
            self.output?.didSelectFavoriteItem(rocketItem: itemModel)
        }
        
        return cell
    }
}
