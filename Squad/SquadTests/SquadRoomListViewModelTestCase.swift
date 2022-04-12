//
//  SquadRoomListViewModelTestCase.swift
//  SquadTests
//
//  Created by Sagar Thummar on 12/04/2022.
//

import XCTest
@testable import Squad

class SquadRoomListViewModelTestCase: XCTestCase {

    func test_fetch_roomList_with_valid_response_testcase() {
        
        let roomListViewModel = RoomViewModel()
        
        roomListViewModel.fetchRooms {
            XCTAssert(roomListViewModel.roomList.value.count > 0) //Here, Assuming Room List always have record
            XCTAssertNil(roomListViewModel.handleError.value) //Valid response must not have error
        }
    }
    
    func test_room_list_search_feature_testcase() {
        
        let roomListViewModel = RoomViewModel()
        
        //Precondition: Fetch Room List
        roomListViewModel.fetchRooms {
            
            let searchString = "2"
            
            let searchRoomResult = roomListViewModel.filterRoom(forSearchString: searchString)
            
            guard searchRoomResult.count > 0, let searchRoomName = searchRoomResult.first?.id else {
                return
            }
            
            XCTAssert(searchRoomName.lowercased().trimmed().contains(searchString.lowercased().trimmed()), "Invalid Search Result")
            XCTAssert(searchRoomResult.count == roomListViewModel.displayRoomList.count, "Room Search Result Are Not Updated.")
            XCTAssert(searchRoomResult.count == roomListViewModel.numberOfItems, "Room search result are not update.")
            
        }
    }

}
