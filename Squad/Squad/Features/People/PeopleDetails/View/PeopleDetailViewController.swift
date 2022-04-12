//
//  PeopleDetailViewController.swift
//  Squad
//
//  Created by Sagar Thummar on 11/04/2022.
//

import UIKit
import SquadComponent
import SquadStyle

class PeopleDetailViewController: SquadBaseViewController {
    
    //MARK:- Properties -
    @IBOutlet weak var profileImageView: SquadImageView! {
        didSet {
            profileImageView.cornerRadius(profileImageView.bounds.height/2)
            profileImageView.drawBorder(borderWidth: 1.5, color: SquadColor.gainsboro.color)
        }
    }
    @IBOutlet weak var nameLabel: SquadLabel!
    @IBOutlet weak var emailLabel: SquadLabel!
    @IBOutlet weak var jobTitleLabel: SquadLabel!
    @IBOutlet weak var faviouriteColorLabel: SquadLabel!
    
    var viewModel: PeopleViewModel!
    var people: People? {
        viewModel.people.value
    }
    
    //MARK:- View Controller Life Cycle Methods -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Bind PeopleViewModel
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Set Navigation Title
        title = people?.name ?? "profile.details.navigation.title".localized
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //Cancel Image Download Tasks
        profileImageView.cancel()
    }
    
    //MARK: - View Configuration Methods -
    private func configureView() {
        
        profileImageView.imgage(people?.imageURL, placeholder: AppImage.placeholder.image)
        nameLabel.text = people?.name
        emailLabel.text = people?.displayEmail
        jobTitleLabel.text = people?.displayJobTitle
        faviouriteColorLabel.text = people?.displayFavouriteColor
    }
    
    private func bindViewModel() {
        viewModel.people.bind { [weak self] people in
            DispatchQueue.main.async { [weak self] in
                self?.configureView()
            }
        }
    }
}
