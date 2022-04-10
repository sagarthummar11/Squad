//
//  String+Extension.swift
//  Squad
//
//  Created by Sagar Thummar on 08/04/2022.
//

import Foundation

extension String {
    
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
    
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
