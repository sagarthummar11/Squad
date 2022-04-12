//
//  SquadTabBarViewController.swift
//  Squad
//
//  Created by Sagar Thummar on 10/04/2022.
//

import UIKit

protocol TabDetailsProtocol {
    var tabItem: UITabBarItem { get }
}

class SquadTabBarViewController: UITabBarController {

    //MARK:- Properties -
    var peopleListViewModel: PeopleListViewModel?
    var peopleCoordinator: PeopleCoordinator?
    
    var roomListViewModel: RoomViewModel?
    var roomListCoordinator: RoomCoordinator?
    
    //MARK: - View Controller Life Cycle Methods -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        configureView()
    }
 
    //MARK: - View Configuration Methods -
    private func configureView() {
        
        let peopleListViewController: PeopleListViewController = UIStoryboard.people.instantiate()
        peopleListViewController.viewModel = peopleListViewModel
        
        let peopleListNavigationController = SquadNavigationController(rootViewController: peopleListViewController)
        peopleCoordinator = PeopleCoordinator(router: SquadRouter(navigationController: peopleListNavigationController))
        peopleListViewController.viewModel.peopleCoordinator = peopleCoordinator
        peopleListNavigationController.tabBarItem = peopleListViewController.tabItem
        
        let roomListViewController: RoomListViewController = UIStoryboard.room.instantiate()
        roomListViewController.viewModel = roomListViewModel
        let roomListNavigationController = SquadNavigationController(rootViewController: roomListViewController)
        roomListCoordinator = RoomCoordinator(router: SquadRouter(navigationController: roomListNavigationController))
        roomListNavigationController.tabBarItem = roomListViewController.tabItem
        
        viewControllers = [peopleListNavigationController, roomListNavigationController]
    }
}

//MARK:- UITabBarControllerDelegate Methods -
extension SquadTabBarViewController: UITabBarControllerDelegate { }
