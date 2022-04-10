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

    //MARK: - View Controller Life Cycle Methods -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        configureView()
    }
 
    //MARK: - View Configuration Methods -
    private func configureView() {
        
        let peopleListViewController: PeopleListViewController = UIStoryboard.people.instantiate()
        let peopleListNavigationController = SquadNavigationController(rootViewController: peopleListViewController)
        peopleListNavigationController.tabBarItem = peopleListViewController.tabItem
        
        let roomListViewController: RoomListViewController = UIStoryboard.room.instantiate()
        let roomListNavigationController = SquadNavigationController(rootViewController: roomListViewController)
        roomListNavigationController.tabBarItem = roomListViewController.tabItem
        
        viewControllers = [peopleListNavigationController, roomListNavigationController]
    }
}

//MARK:- UITabBarControllerDelegate Methods -
extension SquadTabBarViewController: UITabBarControllerDelegate { }
