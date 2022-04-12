//
//  RoomUITests.swift
//  SquadUITests
//
//  Created by Sagar Thummar on 12/04/2022.
//

import XCTest

class RoomUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }

    func testUserNavigationToRoomListScreen() {
        
        let contactListNavigationBar = app.navigationBars["Contact List"]
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: contactListNavigationBar, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        
        let appTabBar = app.tabBars["SquadTabBar"]
        XCTAssertTrue(appTabBar.exists)
        
        let roomsTab = appTabBar.buttons["Rooms"]
        XCTAssertTrue(roomsTab.exists)
        
        roomsTab.tap()
        let roomListNavigationBar = app.navigationBars["Rooms"]
        XCTAssertTrue(roomListNavigationBar.exists)
        
    }

    func testNavigationComponents() {
        
        testUserNavigationToRoomListScreen()
        
        let searchField = app.searchFields["Search Room"]
        XCTAssertTrue(searchField.exists)
        XCTAssert(searchField.label == "Search Room")
        
        let appTabBar = app.tabBars["SquadTabBar"]
        XCTAssertTrue(appTabBar.exists)
        
        let roomsTab = appTabBar.buttons["Rooms"]
        XCTAssertTrue(roomsTab.exists)
        XCTAssertTrue(roomsTab.isSelected)
    }
}
