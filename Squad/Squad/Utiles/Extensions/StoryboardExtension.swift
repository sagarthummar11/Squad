//
//  StoryboardExtension.swift
//  Squad
//
//  Created by Sagar Thummar on 10/04/2022.
//

import UIKit

// Mark: Squad Storyboard List -
extension UIStoryboard {
    
    static let onboarding = UIStoryboard(name: "Onboarding", bundle: Bundle.main)
    static let people = UIStoryboard(name: "People", bundle: Bundle.main)
    static let room = UIStoryboard(name: "Room", bundle: Bundle.main)
}


//MARK:- View Controller Instantiation and Loading Methods - 
extension UIStoryboard {
    
    func instantiate<T: UIViewController>() -> T {
        let className: String

        if #available(iOS 13.0, *) {
            className = String(describing: T.self)
        } else {
            let fullName = NSStringFromClass(T.self)
            className = fullName.components(separatedBy: ".")[1]
        }
        return self.instantiateViewController(withIdentifier: className) as! T
    }
}
