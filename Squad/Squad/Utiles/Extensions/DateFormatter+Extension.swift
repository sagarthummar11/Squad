//
//  DateFormatter+Extension.swift
//  Squad
//
//  Created by Sagar Thummar on 09/04/2022.
//

import Foundation

extension DateFormatter {
    
    static var responseDateFormate: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return dateFormatter
    }
}
