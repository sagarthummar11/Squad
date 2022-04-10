//
//  PeopleTableViewCell.swift
//  Squad
//
//  Created by Sagar Thummar on 10/04/2022.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    var people: People?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(people: People) {
        self.people = people
        
        //Assign A Value
        nameLabel.text = people.name
    }
}
