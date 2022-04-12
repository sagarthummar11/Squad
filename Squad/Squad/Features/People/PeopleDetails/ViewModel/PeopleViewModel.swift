//
//  PeopleViewModel.swift
//  Squad
//
//  Created by Sagar Thummar on 11/04/2022.
//

import Foundation

struct PeopleViewModel {
    
    let people: Box<People?> = Box(nil)
    var onBackTapped: (() -> Void)?
    
    init(people: People, onBack: (() -> Void)?) {
        self.people.value = people
        self.onBackTapped = onBack
    }
}
