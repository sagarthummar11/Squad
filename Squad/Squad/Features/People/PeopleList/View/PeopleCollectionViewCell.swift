//
//  PeopleCollectionViewCell.swift
//  Squad
//
//  Created by Sagar Thummar on 13/04/2022.
//

import UIKit
import SquadComponent
import SquadStyle

class PeopleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var profileImageView: SquadImageView!{
        didSet {
            profileImageView.cornerRadius(profileImageView.bounds.height/2)
            profileImageView.drawBorder(borderWidth: 1.5, color: SquadColor.gainsboro.color)
        }
    }
    @IBOutlet weak var nameLabel: SquadLabel!
    
    var people: People?
    
    func configure(_ people: People) {
        self.people = people
        
        //Assign A Value
        nameLabel.text = people.name
        nameLabel.assign(accessibility: SquadAccessible(accessibleLabel: people.name))
        
        profileImageView.imgage(people.imageURL, placeholder: AppImage.placeholder.image)
        profileImageView.assign(accessibility: SquadAccessible(accessibleLabel: "\(people.name)'s Image"))
        
        accessibilityIdentifier = "PeopleCollectionViewCell"
    }
    
    func cancelDownload() {
        profileImageView.cancel()
    }
}
