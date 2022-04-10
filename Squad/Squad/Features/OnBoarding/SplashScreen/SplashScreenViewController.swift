//
//  SplashScreenViewController.swift
//  Squad
//
//  Created by Sagar Thummar on 09/04/2022.
//

import UIKit
import SquadStyle

class SplashScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let tabViewController: SquadTabBarViewController = UIStoryboard.onboarding.instantiate()
            tabViewController.setAsRootViewController()
        }
    }

}


