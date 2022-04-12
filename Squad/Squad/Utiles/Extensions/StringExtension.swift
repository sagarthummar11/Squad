//
//  String+Extension.swift
//  Squad
//
//  Created by Sagar Thummar on 08/04/2022.
//

import UIKit

extension String {
    
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
    
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}


extension Comparable {
    func clamped(_ f: Self, _ t: Self)  ->  Self {
        var r = self
        if r < f { r = f }
        if r > t { r = t }
        // (use SIMPLE, EXPLICIT code here to make it utterly clear
        // whether we are inclusive, what form of equality, etc etc)
        return r
    }
}
