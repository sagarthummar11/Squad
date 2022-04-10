//
//  PeopleViewModel.swift
//  Squad
//
//  Created by Sagar Thummar on 08/04/2022.
//

import Foundation

struct PeopleViewModel {
    
    //MARK: - Properties -
    private(set) var screenTitle = "Contacts"
     
    var displayPeopleList: [People] = []

    //Binding Properties
    let peopleList: Box<[People]> = Box([])
    let handleError: Box<SquadError?> = Box(nil)
    let searchString: Box<String> = Box("")
    var updateList: (() -> Void)? = nil
    
    //MARK:- Logical Operations -
    
    func fetchPeople() {
        NetworkManager().fetch(requestType: .peopleList, responseType: [People].self) { result in
            switch result {
            case .success(let peopleList):
                self.peopleList.value = peopleList
                
            case .failure(let error):
                self.handleError.value = SquadError(description: error.localizedDescription)
            }
        }
    }
    
    func filterPeople(forSearchString search: String) -> [People] {
        guard searchString.value.trimmed().count > 0 else {
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
}
