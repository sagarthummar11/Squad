//
//  UITableViewExtension.swift
//  Squad
//
//  Created by Sagar Thummar on 10/04/2022.
//

import UIKit

extension UITableView {

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Unable to Dequeue Reusable Table View Cell")
        }

        return cell
    }

}

extension UITableViewCell {
    
    static var identifier: String {
        String(describing: self)
    }
}
