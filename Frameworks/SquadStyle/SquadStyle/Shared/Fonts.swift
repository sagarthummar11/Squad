//
//  Fonts.swift
//  SquadStyle
//
//  Created by Sagar Thummar on 10/04/2022.
//

import UIKit

/* Squad Used Font Names */
enum SquadFontName: String, CaseIterable {
    case didot = "Didot"
    case didotBold = "Didot-Bold"
    case avenirNextRegular = "AvenirNext-Regular"
    case avenirNextMedium = "AvenirNext-Medium"
    case avenirNextBold = "AvenirNext-Bold"
}

public enum SquadFont: String {
    
    case title1
    case title2
    case title3
    case headline1
    case headline2
    case smallHeading
    case bodyLarge
    case bodyBold
    case body
    case bodySmall
    case subhead
    case footnote
    
    var font: UIFont {
        switch self {
        case .title1: return font(.avenirNextMedium, size: 28)
        case .title2: return font(.avenirNextMedium, size: 24)
        case .title3: return font(.avenirNextMedium, size: 20)
        case .headline1: return font(.avenirNextMedium, size: 17)
        case .headline2: return font(.didotBold, size: 17)
        case .smallHeading: return font(.didotBold, size: 15)
        case .bodyLarge: return font(.didotBold, size: 19)
        case .bodyBold: return font(.avenirNextMedium, size: 17)
        case .body: return font(.avenirNextRegular, size: 17)
        case .bodySmall: return font(.avenirNextRegular, size: 14)
        case .subhead: return font(.avenirNextBold, size: 12)
        case .footnote: return font(.didot, size: 10)
        }
    }
    
    func font(_ name: SquadFontName, size: CGFloat) -> UIFont {
        return UIFont(name: name.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}

