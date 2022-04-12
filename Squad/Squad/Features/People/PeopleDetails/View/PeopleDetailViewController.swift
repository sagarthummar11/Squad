//
//  PeopleDetailViewController.swift
//  Squad
//
//  Created by Sagar Thummar on 11/04/2022.
//

import UIKit
import SquadComponent

class PeopleDetailViewController: UIViewController {
    
    //MARK:- Properties -
    @IBOutlet weak var profileImageView: SquadImageView!
    @IBOutlet weak var nameLabel: SquadLabel!
    @IBOutlet weak var emailLabel: SquadLabel!
    @IBOutlet weak var jobTitleLabel: SquadLabel!
    @IBOutlet weak var faviouriteColorLabel: SquadLabel!
    
    var people: People?
    
    var viewModel: PeopleViewModel!
    
    //MARK:- View Controller Life Cycle Methods -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
        
        //Assign Values
        viewModel.people.value = people
        
    }
    
    //MARK: - View Configuration Methods -
    private func configureView() {
        //TODO: View Configuration Methods 
    }
    
    private func bindViewModel() {
        viewModel.people.bind { [weak self] people in
            DispatchQueue.main.async { [weak self] in
                self?.configureView()
            }
        }
    }
}
