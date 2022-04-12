//
//  SquadAccessibility.swift
//  SquadComponent
//
//  Created by Sagar Thummar on 12/04/2022.
//

import UIKit

public protocol SquadAccessibility {
    var isElelmentAccessibile: Bool { get set }
    var accessibleHints: String? { get set }
    var accessibilityTraitsType: UIAccessibilityTraits? { get set }
    var accessibleLabel: String? { get set }
    var accessibleValue: String? { get set }
}


public struct SquadAccessible: SquadAccessibility {
    public var isElelmentAccessibile: Bool = true
    public var accessibleHints: String? = nil
    public var accessibilityTraitsType: UIAccessibilityTraits? = nil
    public var accessibleLabel: String? = nil
    public var accessibleValue: String? = nil
    
    
    public init(isElelmentAccessibile: Bool = true,
                accessibleHints: String? = nil,
                accessibilityTraitsType: UIAccessibilityTraits? = nil,
                accessibleLabel: String? = nil,
                accessibleValue: String? = nil){
        
        self.isElelmentAccessibile = isElelmentAccessibile
        self.accessibleHints = accessibleHints
        self.accessibilityTraitsType = accessibilityTraitsType
        self.accessibleLabel = accessibleLabel
        self.accessibleValue = accessibleValue
    }
}
