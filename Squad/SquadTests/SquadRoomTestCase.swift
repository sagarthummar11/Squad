//
//  SquadRoomTestCase.swift
//  SquadTests
//
//  Created by Sagar Thummar on 12/04/2022.
//

import XCTest
@testable import Squad

class SquadRoomTestCase: XCTestCase {

    
    /*
     
     "room.list.cell.roomLabel.title" = "Room";
     "room.list.cell.available.title" = "Available";
     "room.list.cell.occupied.title" = "Occupied";
     "room.list.cell.maxOccupancy.title" = "Max Occupancy";
     */

    
    func test_room_display_valid_infromation_testcase() {
     
        let roomListViewModel = RoomViewModel()
        
        roomListViewModel.fetchRooms {
            
            XCTAssert(roomListViewModel.roomList.value.count > 0) //Assuming Room List always have record
            XCTAssertNil(roomListViewModel.handleError.value) //Must not have any error
            
            let responseRoom = roomListViewModel.roomList.value.randomElement()!
            
            if responseRoom.isOccupied {
                XCTAssert(responseRoom.roomAvailability == "Occupied", "Invalid Room Availability Format")
            } else {
                XCTAssert(responseRoom.roomAvailability == "Available", "Invalid Room Availability Format")
            }
            
            
            XCTAssert(responseRoom.displayMaxOccupancy == "Max Occupancy: \(responseRoom.maxOccupancy)", "Invalid display max occupancy format")
        }
    }

}
