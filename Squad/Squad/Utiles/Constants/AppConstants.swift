//
//  AppConstants.swift
//  Squad
//
//  Created by Sagar Thummar on 08/04/2022.
//

import Foundation
import UIKit.UIImage

enum AppConstant {
    static let baseURL = "BASE_URL"
}

enum AppImage: String {
    case peopleList = "img_peopleList"
    case peopleListSelected = "img_peopleList_selected"
    case roomList = "img_roomList"
    case roomListSelected = "img_roomList_selected"
    case placeholder = "img_placeholder"
    
    var image: UIImage? {
        UIImage(named: self.rawValue)
    }
}
