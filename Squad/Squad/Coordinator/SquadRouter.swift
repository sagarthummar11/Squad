//
//  SquadRouter.swift
//  Squad
//
//  Created by Sagar Thummar on 11/04/2022.
//

import UIKit

final class SquadRouter: NSObject {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }
    
    //MARK:- Navigation Logic -
    func push(_ viewController: UIViewController, isAnimated: Bool = true) {
        DispatchQueue.main.async { [weak self] in
            self?.navigationController.pushViewController(viewController, animated: isAnimated)
        }
    }
    
    func pop(isAnimated: Bool = true) {
        DispatchQueue.main.async { [weak self] in
            self?.navigationController.popViewController(animated: isAnimated)
        }
    }
    
    func setAsRootViewController(_ viewController: UIViewController, isAnimated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        DispatchQueue.main.async {
            guard let window = UIApplication.window else {
                fatalError("Error: Failed to find the application window.")
            }
            
            if isAnimated {
                UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
                    let oldState: Bool = UIView.areAnimationsEnabled
                    UIView.setAnimationsEnabled(false)
                    window.rootViewController = viewController
                    window.makeKeyAndVisible()
                    UIView.setAnimationsEnabled(oldState)
                }, completion: completion)
            } else {
                window.rootViewController = viewController
            }
        }
    }
}
