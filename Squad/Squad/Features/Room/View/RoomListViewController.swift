//
//  ViewController.swift
//  Squad
//
//  Created by Sagar Thummar on 08/04/2022.
//

import UIKit
import SquadStyle

class RoomListViewController: UIViewController {

    //MARK:- Properties -
    fileprivate let roomTabItem = {
        UITabBarItem(title: "Room", image: nil, selectedImage: nil)
    }()
    
    //MARK:- View Controller Life Cycle Methods - 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }

    //MARK: - View Configuration Methods -
    private func configureView() {
    
    }
}

//MARK:- RoomListViewController TabDetailsProtocol Cofirmation -
extension RoomListViewController: TabDetailsProtocol {
    
    var tabItem: UITabBarItem {
        roomTabItem
    }
}
