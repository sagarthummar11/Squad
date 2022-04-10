//
//  SquadNavigationController.swift
//  Squad
//
//  Created by Sagar Thummar on 10/04/2022.
//

import UIKit
import SquadStyle

class SquadNavigationController: UINavigationController {

    //MARK:- View Controller Life Cycle Methods - 
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationBar.backgroundColor = .white
    }

}
