//
//  SplashScreenViewController.swift
//  Squad
//
//  Created by Sagar Thummar on 09/04/2022.
//

import UIKit
import SquadStyle

class SplashScreenViewController: UIViewController {

    var router: SquadRouter?

    static func navigate(completion: (() -> Void)?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion?()
        }
    }
}


