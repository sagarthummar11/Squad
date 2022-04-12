//
//  MainAppCoordinator.swift
//  Squad
//
//  Created by Sagar Thummar on 11/04/2022.
//

import UIKit

protocol SquadNavigator {
    associatedtype Destination
    var router: SquadRouter { get }
    func navigate(to destination: Destination)
}


class SquadCoordinator: NSObject {
    
    let router: SquadRouter
    
    init(router: SquadRouter) {
        self.router = router
        super.init()
    }
}

final class MainAppCoordinator: SquadCoordinator, SquadNavigator {
    
    override init(router: SquadRouter) {
        super.init(router: router)
    }
    
    enum Destination {
        case splashScreen
        case homeScreen
        case peopleDetail(People, PeopleCoordinator?)
    }
    
    public func navigate(to destination: MainAppCoordinator.Destination) {
        switch destination {
            case .splashScreen:
                SplashScreenViewController.navigate { [weak self] in
                    self?.navigate(to: .homeScreen)
                }
                
            case .homeScreen:
                let tabViewController: SquadTabBarViewController = UIStoryboard.onboarding.instantiate()
                let peopleListViewModel = PeopleListViewModel { [weak self] (people, peopleListCoordinator) in
                    self?.navigate(to: .peopleDetail(people, peopleListCoordinator))
                }
                tabViewController.peopleListViewModel = peopleListViewModel
                tabViewController.roomListViewModel = RoomViewModel()
                router.setAsRootViewController(tabViewController)
                
        case .peopleDetail(let people, let coordinator):
                let peopleDetailViewController: PeopleDetailViewController = UIStoryboard.people.instantiate()
                let peopleDetailViewModel = PeopleViewModel(people: people, onBack: { [weak self] in
                    self?.router.pop()
                })
                peopleDetailViewController.viewModel = peopleDetailViewModel
                coordinator?.router.push(peopleDetailViewController)
        }
    }
    
    func load(_ destination: MainAppCoordinator.Destination) {
        navigate(to: destination)
    }
}


final class PeopleCoordinator: SquadCoordinator { }

final class RoomCoordinator: SquadCoordinator { }

