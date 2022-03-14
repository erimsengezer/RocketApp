//
//  MyFavoritesViewController.swift
//  RocketApp
//
//  Created by Erim Şengezer on 8.03.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
//

import UIKit

protocol MyFavoritesViewProtocol: AnyObject {
    var presenter: MyFavoritesPresenterProtocol { get }
    
    func refresh()
    func configureTableView()
    func configureNavigationBar()
}

class MyFavoritesViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak private var tableView: UITableView!
    
    // MARK: - Public Properties
    let presenter: MyFavoritesPresenterProtocol
    
    // MARK: - Private Properties
    private var tableViewDelegate: MyFavoritesTableViewDelegate?
    private var tableViewDataSource: MyFavoritesTableViewDataSource?
    
    // MARK: Initializers
    init(presenter: MyFavoritesPresenterProtocol) {
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
}

extension MyFavoritesViewController: MyFavoritesViewProtocol {
    
    func configureNavigationBar() {
        self.title = "My Favorites"
    }

    func refresh() {
        guard let viewModel = presenter.viewModel else { return }
        self.tableViewDataSource?.update(viewModel: viewModel)
        tableView.reloadData()
    }
    
    func configureTableView() {
        let rocketCell = UINib(nibName: RocketListTableViewCell.cellIdentifier, bundle: nil)
        self.tableView.register(rocketCell, forCellReuseIdentifier: RocketListTableViewCell.cellIdentifier)
        
        self.tableViewDelegate = MyFavoritesTableViewDelegate()
        self.tableViewDataSource = MyFavoritesTableViewDataSource()
        
        tableView.delegate = self.tableViewDelegate
        tableView.dataSource = self.tableViewDataSource
        
        self.tableViewDelegate?.output = self
        self.tableViewDataSource?.output = self
    }
}

extension MyFavoritesViewController: MyFavoritesTableViewDelegateOutput {
    func didSelectRow(indexPath: IndexPath) {
        guard let viewModel = presenter.viewModel else { return }
        if let coreDataModel = viewModel.getItemModel(indexPath: indexPath){
            let itemModel = viewModel.createItemModelToCoreDataModel(coreDataModel: coreDataModel)
            presenter.presentToDetailScreen(rocketItem: itemModel)
        }
    }
    
    func didSelectFavoriteItem(rocketItem: RocketElement) {
        presenter.saveFavoriteRocket(rocket: rocketItem)
    }
}
