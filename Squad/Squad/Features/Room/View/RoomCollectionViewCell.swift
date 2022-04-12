//
//  RoomCollectionViewCell.swift
//  Squad
//
//  Created by Sagar Thummar on 11/04/2022.
//

import UIKit
import SquadComponent
import SquadStyle

class RoomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: SquadLabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var availabilityStatusLabel: UILabel!
    @IBOutlet weak var maxOccupancyLabel: UILabel!
    
    var room: Room?
    
    //MARK:- Configuration Methods -
    
    func configure(_ room: Room) {
        containerView.cornerRadius(15)
        containerView.drawBorder(borderWidth: 1, color: SquadColor.gainsboro.color)
        
        titleLabel.text = "room.list.cell.roomLabel.title".localized
        numberLabel.text = room.id
        availabilityStatusLabel.text = room.roomAvailability
        availabilityStatusLabel.textColor = room.availabilityColor
        maxOccupancyLabel.text = room.displayMaxOccupancy
    }
}
