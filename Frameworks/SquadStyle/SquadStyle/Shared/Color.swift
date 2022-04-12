//
//  Color.swift
//  SquadStyle
//
//  Created by Sagar Thummar on 08/04/2022.
//

import Foundation
import UIKit

let SquadStyleBundle = Bundle(identifier: "com.vm.SquadStyle")

public enum SquadColor: String, CaseIterable {
    case appTheme
    case myrtleGreen
    case gainsboro
    case blackOlive
    case yellowOrange
    case cyberGraph
    case vividTangerine
    case greenSheen
    case vegasGold
    case honeydew
    
    public var color: UIColor {
        return access(self.rawValue)
    }
    
    private func access(_ string: String) -> UIColor {
        return UIColor(named: string, in: SquadStyleBundle, compatibleWith: .none) ?? .black
    }
    
    public static var randomColor: UIColor {
        return SquadColor.allCases.randomElement()?.color ?? .systemPink
    }
}

extension UIColor {

    public convenience init?(hexString: String) {
        let red, green, blue, alpha: CGFloat

        if hexString.hasPrefix("#") {
            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            let hexColor = String(hexString[start...])
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0

            if hexColor.count == 8 {
                if scanner.scanHexInt64(&hexNumber) {
                    red = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    green = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    blue = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    alpha = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: red, green: green, blue: blue, alpha: alpha)
                    return
                }
            } else if hexColor.count == 6 {
                if scanner.scanHexInt64(&hexNumber) {
                    red = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    green = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    blue = CGFloat(hexNumber & 0x0000ff) / 255

                    self.init(red: red, green: green, blue: blue, alpha: 1)
                    return
                }
            }
        }
        return nil
    }
}
