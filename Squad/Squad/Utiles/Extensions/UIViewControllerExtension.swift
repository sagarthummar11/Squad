//
//  UIViewControllerExtension.swift
//  Squad
//
//  Created by Sagar Thummar on 10/04/2022.
//

import UIKit

extension UIViewController {
    
    func setAsRootViewController(isAnimated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        
        guard let window = UIApplication.shared.keyWindow ?? UIApplication.shared.delegate?.window ?? nil else {
            fatalError("Error: Failed to find the application window.")
        }
        
        if isAnimated {
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
                let oldState: Bool = UIView.areAnimationsEnabled
                UIView.setAnimationsEnabled(false)
                window.rootViewController = self
                window.makeKeyAndVisible()
                UIView.setAnimationsEnabled(oldState)
            }, completion: completion)
        } else {
            window.rootViewController = self
        }
    }
}
