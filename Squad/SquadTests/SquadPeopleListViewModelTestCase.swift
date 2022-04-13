//
//  SquadPeopleListViewModelTestCase.swift
//  SquadTests
//
//  Created by Sagar Thummar on 12/04/2022.
//

import XCTest
@testable import Squad

class SquadPeopleListViewModelTestCase: XCTestCase {

    func test_fetch_peopleList_with_valid_response_testcase() {
        
        let peopleListViewModel = PeopleListViewModel()
        peopleListViewModel.fetchPeople {
            print("peopleListViewModel.peopleList.value.count: \(peopleListViewModel.peopleList.value.count)")
            XCTAssert(peopleListViewModel.peopleList.value.count > 0) //Assuming People List always have record
            XCTAssertNil(peopleListViewModel.handleError.value) //Must not have any error
        }
    }
    
    func test_people_list_search_feature_testcase() {
        
        let peopleListViewModel = PeopleListViewModel()
        
        //Precondition: Fetch People List
        peopleListViewModel.fetchPeople {

            let searchString = "Maggie"
            
            let searchPeopleResult = peopleListViewModel.filterPeople(forSearchString: searchString)
            
            guard searchPeopleResult.count > 0, let searchPeopleName = searchPeopleResult.first?.name else { return }
            
            XCTAssert(searchPeopleName.lowercased().trimmed().contains(searchString.lowercased().trimmed()), "Invalid Search Result")
            XCTAssert(searchPeopleResult.count == peopleListViewModel.displayPeopleList.count, "People Search Result Are Not Updated.")
            XCTAssert(searchPeopleResult.count == peopleListViewModel.numberOfItems, "People search result are not update.")
        }
    }
}
