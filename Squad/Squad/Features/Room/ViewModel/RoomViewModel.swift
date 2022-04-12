//
//  RoomViewModel.swift
//  Squad
//
//  Created by Sagar Thummar on 08/04/2022.
//

import Foundation

struct RoomViewModel {
    
    //MARK: - Properties -
    var displayRoomList: [Room] = []
    
    //Binding Properties
    let roomList: Box<[Room]> = Box([])
    let handleError: Box<SquadError?> = Box(nil)
    let searchString: Box<String> = Box("")
    var updateList: (() -> Void)? = nil
    
    //MARK:- Logical Operations -
    
    func fetchRooms(handler: (() -> Void)? = nil) {
        NetworkManager().fetch(requestType: .roomList, responseType: [Room].self) { result in
            switch result {
            case .success(let rooms):
                roomList.value = rooms
            case .failure(let error):
                handleError.value = SquadError(description: error.localizedDescription)
            }
            handler?()
        }
    }
    
    func filterRoom(forSearchString search: String) -> [Room] {
        guard searchString.value.trimmed().count > 0 else {
            return roomList.value
        }
        
        return roomList.value.filter({ $0.id.lowercased().trimmed().contains(search.lowercased().trimmed()) })
    }
    
    //Perform Search and Sort Operation
    mutating func performSearchSortOperation() {
        
        //Search Action
        displayRoomList = filterRoom(forSearchString: searchString.value)
        
        //Update UI Action
        updateList?()
    }
    
    //MARK: - Table View Related Operations -
    
    var numberOfSections: Int {
        1
    }
    
    var numberOfItems: Int {
        return displayRoomList.count
    }
    
    func fetchRoom(_ indexPath: IndexPath) -> Room {
        displayRoomList[indexPath.row]
    }

}
