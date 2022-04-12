//
//  PeopleListViewController.swift
//  Squad
//
//  Created by Sagar Thummar on 08/04/2022.
//

import UIKit

class PeopleListViewController: SquadBaseViewController {

    //MARK:- Properties -
    @IBOutlet weak var peopleTableView: UITableView! {
        didSet {
            peopleTableView.dataSource = self
            peopleTableView.delegate = self
        }
    }
    
    var viewModel: PeopleListViewModel!
    
    fileprivate let peopleTabItem = {
        UITabBarItem(title: "tab.people.title".localized,
                     image: AppImage.peopleList.image,
                     selectedImage: AppImage.peopleListSelected.image)
    }()
    
    fileprivate let peopleSearchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search People"
        return searchController
    }()
    
    //MARK:- View Controller Life Cycle Methods -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        //Configure Navigation Bar
        title = "profile.list.navigation.title".localized
    }

    //MARK: - View Configuration Methods -
    private func configureView() {
        viewModel.fetchPeople()
        
        //Configure Search bar
        peopleSearchController.searchResultsUpdater = self
        navigationItem.searchController = peopleSearchController
        definesPresentationContext = true
    }
    
    private func bindViewModel() {
        viewModel.peopleList.bind { [weak self] peopleList in
            self?.viewModel.performSearchSortOperation()
        }
        
        viewModel.searchString.bind { [weak self] searchString in
            self?.viewModel.performSearchSortOperation()
        }
        
        viewModel.handleError.bind { [weak self] viewError in
            guard let error = viewError else { return }
        }
        
        viewModel.updateList = { [weak self] in
            DispatchQueue.main.async { [weak self] in
                self?.peopleTableView.reloadData()
            }
        }
    }
}

//MARK: - PeopleListViewController TabDetailsProtocol Confirmation -
extension PeopleListViewController: TabDetailsProtocol {
    
    var tabItem: UITabBarItem {
        peopleTabItem
    }
}

//MARK:- UITableView Data Source & Delegate Methods -
extension PeopleListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let peopleTableViewCell: PeopleTableViewCell = peopleTableView.dequeueReusableCell(for: indexPath)
        let people = viewModel.fetchPeople(indexPath)
        peopleTableViewCell.configure(people: people)
        return peopleTableViewCell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableCell = cell as? PeopleTableViewCell else { return }
        tableCell.cancelDownload()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectPeople(indexPath)
    }
}

//MARK:- UISearchResultsUpdating Methods -
extension PeopleListViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        viewModel.searchString.value = searchController.searchBar.text?.trimmed() ?? ""
    }
}
