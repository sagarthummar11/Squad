//
//  UICollectionViewExtension.swift
//  Squad
//
//  Created by Sagar Thummar on 10/04/2022.
//

import UIKit

extension UICollectionView {
    
    func dequeue<T: UICollectionViewCell>(cellForItemAt indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: "\(T.self)", for: indexPath) as! T
    }
}
