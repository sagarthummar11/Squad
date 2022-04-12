//
//  SquadPeopleTestCase.swift
//  SquadTests
//
//  Created by Sagar Thummar on 12/04/2022.
//

import XCTest
@testable import Squad

class SquadPeopleTestCase: XCTestCase {

    func test_people_display_valid_infromation_testcase() {
     
        let peopleListViewModel = PeopleListViewModel()
        
        peopleListViewModel.fetchPeople {
            print("peopleListViewModel.peopleList.value.count: \(peopleListViewModel.peopleList.value.count)")
            XCTAssert(peopleListViewModel.peopleList.value.count > 0) //Assuming People List always have record
            XCTAssertNil(peopleListViewModel.handleError.value) //Must not have any error
            
            let responsePeople = peopleListViewModel.peopleList.value.randomElement()!
            
            XCTAssert(responsePeople.name == "\(responsePeople.firstName) \(responsePeople.lastName)", "Invalid name format")
            XCTAssert(responsePeople.displayEmail == "Email: \(responsePeople.email ?? "-")", "Invalid display email format")
            XCTAssert(responsePeople.displayJobTitle == "Job Title: \(responsePeople.displayJobTitle ?? "-")", "Invalid display job title format")
            XCTAssert(responsePeople.displayFavouriteColor == "Favourite Colour: \(responsePeople.favouriteColor ?? "-")", "Invalud display display favourite color format")
        }
    }
}
