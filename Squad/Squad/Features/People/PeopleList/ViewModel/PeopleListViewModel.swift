//
//  PeopleViewModel.swift
//  Squad
//
//  Created by Sagar Thummar on 08/04/2022.
//

import Foundation

struct PeopleListViewModel {
    
    //MARK: - Properties -
    var displayPeopleList: [People] = []
    var peopleCoordinator: PeopleCoordinator?

    //Binding Properties
    let peopleList: Box<[People]> = Box([])
    let handleError: Box<SquadError?> = Box(nil)
    let searchString: Box<String> = Box("")
    var updateList: (() -> Void)? = nil
    var peopleSelected: ((People, PeopleCoordinator?) -> Void)?
    
    init() { }
    
    init(onSelectPeople: @escaping ((People, PeopleCoordinator?) -> Void)) {
        self.peopleSelected = onSelectPeople
    }
    
    //MARK:- Logical Operations -
    
    func fetchPeople(handler: (() -> ())? = nil) {
        NetworkManager().fetch(requestType: .peopleList, responseType: [People].self) { result in
            switch result {
            case .success(let peopleList):
                self.peopleList.value = peopleList
                
            case .failure(let error):
                self.handleError.value = SquadError(description: error.localizedDescription)
            }
            handler?()
        }
    }
    
    func filterPeople(forSearchString search: String) -> [People] {
        guard search.trimmed().count > 0 else {
            return peopleList.value
        }
        
        return peopleList.value.filter({ $0.name.lowercased().trimmed().contains(search.lowercased().trimmed()) })
    }
    
    //Perform Search and Sort Operation
    mutating func performSearchSortOperation() {
        
        //Search Action
        displayPeopleList = filterPeople(forSearchString: searchString.value)
        
        //Update UI Action
        updateList?()
    }
    
    //MARK: - Table View Related Operations -
    
    var numberOfSections: Int {
        1
    }
    
    var numberOfRows: Int {
        displayPeopleList.count
    }
    
    func fetchPeople(_ indexPath: IndexPath) -> People {
        displayPeopleList[indexPath.row]
    }
    
    func didSelectPeople(_ indexPath: IndexPath) {
        let people = displayPeopleList[indexPath.row]
        peopleSelected?(people, peopleCoordinator)
    }
}
