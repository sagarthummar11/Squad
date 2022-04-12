//
//  UIApplicationExtension.swift
//  Squad
//
//  Created by Sagar Thummar on 11/04/2022.
//

import UIKit

extension UIApplication {
    
    static var window: UIWindow? {
        if #available(iOS 13, *) {
            return (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window
        } else {
            return UIApplication.shared.keyWindow ?? UIApplication.shared.windows.first
        }
    }
}
