//
//  MyFavoritesTableViewDataSource.swift
//  RocketApp
//
//  Created by Erim Şengezer on 11.03.2022.
//

import UIKit

class MyFavoritesTableViewDataSource: NSObject {
    private var viewModel: MyFavoritesViewModel?
    weak var output: MyFavoritesTableViewDelegateOutput?
    
    func update(viewModel: MyFavoritesViewModel) {
        self.viewModel = viewModel
    }
}

extension MyFavoritesTableViewDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if viewModel?.numberOfItems == 0 || viewModel?.numberOfItems == nil {
            tableView.setEmptyMessage("There is no favorite rocket !")
        } else {
            tableView.restore()
        }
        
        return viewModel?.numberOfItems ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RocketListTableViewCell.cellIdentifier,
                                                       for: indexPath) as? RocketListTableViewCell,
              let coreDataModel = viewModel?.getItemModel(indexPath: indexPath) else { return UITableViewCell() }
        
        let isExistLocalData = viewModel?.isExistLocalData(indexPath: indexPath)
        
        if let itemModel = self.viewModel?.createItemModelToCoreDataModel(coreDataModel: coreDataModel) {
            cell.configureCell(itemModel: itemModel, isExistLocalData: isExistLocalData, indexPath: indexPath)
            
            cell.favButtonPressed = {
                self.output?.didSelectFavoriteItem(rocketItem: itemModel)
            }
        }
        
        return cell
    }
}
