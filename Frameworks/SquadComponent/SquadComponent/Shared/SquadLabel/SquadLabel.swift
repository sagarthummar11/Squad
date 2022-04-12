//
//  SquadLabel.swift
//  SquadComponent
//
//  Created by Sagar Thummar on 11/04/2022.
//

import UIKit

public class SquadLabel: UILabel, SquadAccessibility {
    
    public var isElelmentAccessibile: Bool = true {
        didSet {
            isAccessibilityElement = isElelmentAccessibile
        }
    }
    public var accessibilityTraitsType: UIAccessibilityTraits? {
        didSet {
            accessibilityTraits = accessibilityTraitsType ?? .none
        }
    }
    public var accessibleHints: String? {
        didSet {
            accessibilityHint = accessibleHints
        }
    }
    public var accessibleLabel: String? {
        didSet {
            accessibilityLabel = accessibleLabel
        }
    }
    public var accessibleValue: String? {
        didSet {
            accessibilityValue = accessibleValue
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        // This will call `awakeFromNib` in your code
        setup()
    }
    
    private func setup() {
        self.textColor = .red
        accessibilityTraitsType = .staticText
    }
    
    public func assign(accessibility: SquadAccessibility) {
        
        isElelmentAccessibile = accessibility.isElelmentAccessibile
        accessibleHints = accessibility.accessibleHints
        accessibilityTraitsType = accessibility.accessibilityTraitsType
        accessibleLabel = accessibility.accessibleLabel
        accessibleValue = accessibility.accessibleValue
    }
    
    public func configureView() {
        self.textColor = .blue
    }
}
