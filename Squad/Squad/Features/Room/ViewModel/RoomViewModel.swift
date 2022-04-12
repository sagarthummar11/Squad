//
//  RoomViewModel.swift
//  Squad
//
//  Created by Sagar Thummar on 08/04/2022.
//

import Foundation

struct RoomViewModel {
    
    //MARK: - Properties -
    
    //Binding Properties
    let roomList: Box<[Room]> = Box([])
    let handleError: Box<SquadError?> = Box(nil)
    
    //MARK:- Logical Operations -
    
    func fetchRooms() {
        NetworkManager().fetch(requestType: .roomList, responseType: [Room].self) { result in
            switch result {
            case .success(let rooms):
                roomList.value = rooms
            case .failure(let error):
                handleError.value = SquadError(description: error.localizedDescription)
            }
        }
    }
    
    //MARK: - Table View Related Operations -
    
    var numberOfSections: Int {
        1
    }
    
    var numberOfItems: Int {
        return roomList.value.count
    }
    
    func fetchRoom(_ indexPath: IndexPath) -> Room {
        roomList.value[indexPath.row]
    }

}
