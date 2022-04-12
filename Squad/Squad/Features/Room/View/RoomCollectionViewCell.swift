//
//  RoomCollectionViewCell.swift
//  Squad
//
//  Created by Sagar Thummar on 11/04/2022.
//

import UIKit
import SquadComponent

class RoomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: SquadLabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var availabilityStatusLabel: UILabel!
    @IBOutlet weak var maxOccupancyLabel: UILabel!
    
    //MARK:- Configuration Methods -
    
    func configureView() {
        containerView.cornerRadius(15)
        containerView.drawBorder(borderWidth: 5, color: .orange)
        titleLabel.configureView()
    }
}
