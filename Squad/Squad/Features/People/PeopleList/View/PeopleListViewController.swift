//
//  PeopleListViewController.swift
//  Squad
//
//  Created by Sagar Thummar on 08/04/2022.
//

import UIKit

class PeopleListViewController: SquadBaseViewController {

    //MARK:- Properties -
    @IBOutlet weak var peopleCollectionView: UICollectionView! {
        didSet {
            peopleCollectionView.dataSource = self
            peopleCollectionView.delegate = self
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
        searchController.searchBar.placeholder = "profile.list.searchbar.placeholder".localized
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
                self?.peopleCollectionView.reloadData()
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

//MARK: - UICollectionView Data Source & Delegate Methods -
extension PeopleListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let peopleCell: PeopleCollectionViewCell = peopleCollectionView.dequeue(cellForItemAt: indexPath)
        let people = viewModel.fetchPeople(indexPath)
        peopleCell.configure(people)
        return peopleCell
    }
}

//MARK:- UICollectionView DataSource & Delegate Methods -
extension PeopleListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if UIScreen.main.traitCollection.userInterfaceIdiom == .pad {
            let cellSize = (collectionView.frame.width - 40)/3
            let cellWidth = cellSize.clamped(cellSize, 300)
            return CGSize(width: cellWidth, height: 100)
        } else {
            let cellWidth = collectionView.frame.width - 20
            return CGSize(width: cellWidth, height: 100)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectPeople(indexPath)
    }
}

//MARK:- UISearchResultsUpdating Methods -
extension PeopleListViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        viewModel.searchString.value = searchController.searchBar.text?.trimmed() ?? ""
    }
}
