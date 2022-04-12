//
//  PeopleTableViewCell.swift
//  Squad
//
//  Created by Sagar Thummar on 10/04/2022.
//

import UIKit
import SquadComponent
import SquadStyle

class PeopleTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: SquadLabel!
    @IBOutlet weak var profileImageView: SquadImageView! {
        didSet {
            profileImageView.cornerRadius(profileImageView.bounds.height/2)
            profileImageView.drawBorder(borderWidth: 1.5, color: SquadColor.gainsboro.color)
        }
    }
    
    var people: People?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(people: People) {
        self.people = people
        
        //Assign A Value
        nameLabel.text = people.name
        profileImageView.imgage(people.imageURL, placeholder: AppImage.placeholder.image)
    }
    
    func cancelDownload() {
        profileImageView.cancel()
    }
}
