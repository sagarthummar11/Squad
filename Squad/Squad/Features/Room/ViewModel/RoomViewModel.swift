//
//  RoomViewModel.swift
//  Squad
//
//  Created by Sagar Thummar on 08/04/2022.
//

import Foundation

struct RoomViewModel {
    
    var rooms: [Room] = []
    
    func fetchRooms() {
        NetworkManager().fetch(requestType: .roomList, responseType: [Room].self) { result in
            switch result {
            case .success(let peopleList):
                print(peopleList)
            case .failure(let error):
                print(error)
            }
        }
    }
}
