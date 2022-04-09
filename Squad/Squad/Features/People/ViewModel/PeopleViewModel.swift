//
//  PeopleViewModel.swift
//  Squad
//
//  Created by Sagar Thummar on 08/04/2022.
//

import Foundation

struct PeopleViewModel {
    
    let people: [People] = []
    
    func fetchPeople() {
        NetworkManager().fetch(requestType: .peopleList, responseType: [People].self) { result in
            switch result {
            case .success(let peopleList):
                print(peopleList)
            case .failure(let error):
                print(error)
            }
        }
    }
}
