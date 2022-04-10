//
//  PeopleListViewController.swift
//  Squad
//
//  Created by Sagar Thummar on 08/04/2022.
//

import UIKit

class PeopleListViewController: UIViewController {

    //MARK:- Properties -
    @IBOutlet weak var peopleTableView: UITableView! {
        didSet {
            peopleTableView.dataSource = self
            peopleTableView.delegate = self
        }
    }
    
    private var viewModel = PeopleViewModel()
    
    fileprivate let peopleTabItem = {
        UITabBarItem(title: "People", image: nil, selectedImage: nil)
    }()
    
    //MARK:- View Controller Life Cycle Methods -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        bindViewModel()
    }

    //MARK: - View Configuration Methods -
    private func configureView() {
        viewModel.fetchPeople()
    }
    
    private func bindViewModel() {
        viewModel.peopleList.bind { [weak self] peopleList in
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
}
