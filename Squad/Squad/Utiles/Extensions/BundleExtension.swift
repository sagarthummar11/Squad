//
//  Bundle+Extension.swift
//  Squad
//
//  Created by Sagar Thummar on 08/04/2022.
//

import Foundation

extension Bundle {
    
    var baseURL: String? {
        return Bundle.main.infoDictionary?[AppConstant.baseURL] as? String
    }
}
