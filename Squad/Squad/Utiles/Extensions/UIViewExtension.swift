//
//  UIViewExtension.swift
//  Squad
//
//  Created by Sagar Thummar on 11/04/2022.
//

import UIKit

extension UIView {
    
    func cornerRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func drawBorder(borderWidth width: CGFloat = 2.0, color: UIColor = .white) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}
