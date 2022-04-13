//
//  SquadImageView.swift
//  SquadComponent
//
//  Created by Sagar Thummar on 11/04/2022.
//

import UIKit
import Kingfisher
import SquadStyle

public class SquadImageView: UIImageView, SquadAccessibility {

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
    
    public func assign(accessibility: SquadAccessibility) {
        
        isElelmentAccessibile = accessibility.isElelmentAccessibile
        accessibleHints = accessibility.accessibleHints
        accessibilityTraitsType = accessibility.accessibilityTraitsType
        accessibleLabel = accessibility.accessibleLabel
        accessibleValue = accessibility.accessibleValue
    }
    
    private func setup() {
        backgroundColor = SquadColor.gainsboro.color
        accessibilityTraitsType = .image
        
        //Show Activity While Downloading Image
        self.kf.indicatorType = .activity
    }

    public func imgage(_ url: URL?, placeholder: UIImage?, errorCompletion: ((Error) -> Void)? = nil) {
        self.kf.setImage(with: url, placeholder: placeholder, options: [.transition(.fade(0.25))]) { result in
            switch result {
                case .success(let response):
                    self.image = response.image

                case .failure(let error):
                    errorCompletion?(error)
            }
        }
    }
    
    public func cancel() {
        self.kf.cancelDownloadTask()
    }
}
