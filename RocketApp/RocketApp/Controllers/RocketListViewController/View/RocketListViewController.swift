//
//  RocketListViewController.swift
//  RocketApp
//
//  Created by Erim Şengezer on 8.03.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
//

import UIKit

protocol RocketListViewProtocol: AnyObject {
    var presenter: RocketListPresenterProtocol { get }
    
    func configureTableView()
    func refresh()
    func configureNavigationBar()
}

class RocketListViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak private var tableView: UITableView!
    
    
    // MARK: - Public Properties
    let presenter: RocketListPresenterProtocol
    
    // MARK: - Private Properties
    private var tableViewDelegate: RocketListTableViewDelegate?
    private var tableViewDataSource: RocketListTableViewDataSource?
    
    // MARK: Initializers
    init(presenter: RocketListPresenterProtocol) {
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

extension RocketListViewController: RocketListViewProtocol {
    
    func refresh() {
        guard let viewModel = presenter.viewModel else { return }
        tableViewDataSource?.update(viewModel: viewModel)
        tableView.reloadData()
    }
    
    func configureNavigationBar() {
        self.title = "Rocket List"
    }
    
    func configureTableView() {
        let rocketCell = UINib(nibName: RocketListTableViewCell.cellIdentifier, bundle: nil)
        self.tableView.register(rocketCell, forCellReuseIdentifier: RocketListTableViewCell.cellIdentifier)
        
        self.tableViewDelegate = RocketListTableViewDelegate()
        self.tableViewDataSource = RocketListTableViewDataSource()
        
        tableView.delegate = self.tableViewDelegate
        tableView.dataSource = self.tableViewDataSource
        
        self.tableViewDelegate?.output = self
        self.tableViewDataSource?.output = self
    }
}


extension RocketListViewController: RocketListTableViewDelegateOutput {
    
    func didSelectRow(indexPath: IndexPath) {
        if let itemModel = presenter.viewModel?.getItemModel(indexPath: indexPath) {
            presenter.presentToDetailScreen(rocketItem: itemModel)
        }
    }
    
    func didSelectFavoriteItem(rocketItem: RocketElement) {
        presenter.saveFavoriteRocket(rocket: rocketItem)
    }
}
