//
//  SquadImageView.swift
//  SquadComponent
//
//  Created by Sagar Thummar on 11/04/2022.
//

import UIKit
import Kingfisher

public class SquadImageView: UIImageView {

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
        
    }

}
