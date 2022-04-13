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
    @IBOutlet weak var titleLabel: Headline2Label!
    @IBOutlet weak var numberLabel: Title1Label!
    @IBOutlet weak var availabilityStatusLabel: SmallHeadingLabel!
    @IBOutlet weak var maxOccupancyLabel: BodySmallLabel!
    
    var room: Room?
    
    //MARK:- Configuration Methods -
    
    func configure(_ room: Room) {
        containerView.cornerRadius(15)
        containerView.drawBorder(borderWidth: 1, color: SquadColor.gainsboro.color)
        
        let titleString = "room.list.cell.roomLabel.title".localized
        titleLabel.text = titleString
        titleLabel.assign(accessibility: SquadAccessible(accessibleLabel: "\(titleString) \(room.id)"))
        
        numberLabel.text = room.id
        numberLabel.assign(accessibility: SquadAccessible(isElelmentAccessibile: false))
        
        availabilityStatusLabel.text = room.roomAvailability
        availabilityStatusLabel.assign(accessibility: SquadAccessible(accessibleLabel: "Room is \(room.roomAvailability)"))
        
        availabilityStatusLabel.textColor = room.availabilityColor
        maxOccupancyLabel.text = room.displayMaxOccupancy
        maxOccupancyLabel.assign(accessibility: SquadAccessible(accessibleLabel: room.displayMaxOccupancy))
    }
}
