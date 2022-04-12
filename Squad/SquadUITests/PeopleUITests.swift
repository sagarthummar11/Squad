//
//  PeopleUITests.swift
//  SquadUITests
//
//  Created by Sagar Thummar on 12/04/2022.
//

import XCTest

class PeopleUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    func testPeopleListNavigationComponentExistance() {
        
        let app = XCUIApplication()
        let contactListNavigationBar = app.navigationBars["Contact List"]
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: contactListNavigationBar, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertTrue(contactListNavigationBar.exists)
        XCTAssert(app.staticTexts["Contact List"].exists)
        
        let searchField = app.searchFields["Search People"]
        XCTAssertTrue(searchField.exists)
        XCTAssert(searchField.label == "Search People")
    }
    
    func testAppTabbarExistance() {
        
        let app = XCUIApplication()
        let contactListNavigationBar = app.navigationBars["Contact List"]
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: contactListNavigationBar, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        
        let appTabBar = app.tabBars["SquadTabBar"]
        XCTAssertTrue(appTabBar.exists)
        
        let contactListTab = appTabBar.buttons["Contact List"]
        XCTAssertTrue(contactListTab.exists)
        XCTAssertTrue(contactListTab.isSelected)
        
        let roomsTab = appTabBar.buttons["Rooms"]
        XCTAssertTrue(roomsTab.exists)
    }
    
    func testUserNavigationToPeopleDetailsScreen() {
        
        let app = XCUIApplication()
        let contactListNavigationBar = app.navigationBars["Contact List"]
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: contactListNavigationBar, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        
        let appTabBar = app.tabBars["SquadTabBar"]
        XCTAssertTrue(appTabBar.exists)
        
        let contactListTab = appTabBar.buttons["Contact List"]
        XCTAssertTrue(contactListTab.exists)
        
        guard contactListTab.isSelected else { return }
        
        let peopleTableViewCell = app.cells["SquadTableViewCell"].firstMatch
        XCTAssertTrue(peopleTableViewCell.exists)
        
        peopleTableViewCell.tap() //Navigate user to Details Screen
        
        let contactDetailView = app.otherElements["PeopleDetailView"]
        XCTAssertTrue(contactDetailView.exists) //Detail View Exists
    }
}
