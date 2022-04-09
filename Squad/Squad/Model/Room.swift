//
//  Room.swift
//  Squad
//
//  Created by Sagar Thummar on 08/04/2022.
//

import Foundation

struct Room: Identifiable, Codable {
    let id: String
    let maxOccupancy: Int
    let isOccupied: Bool
    let createdAt: Date
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        maxOccupancy = try container.decode(Int.self, forKey: .maxOccupancy)
        isOccupied = try container.decode(Bool.self, forKey: .isOccupied)
        
        let dateString = try container.decode(String.self, forKey: .createdAt)
        if let formattedDate = DateFormatter.responseDateFormate.date(from: dateString) {
            createdAt = formattedDate
        } else {
            throw DecodingError.dataCorruptedError(forKey: .createdAt,
                          in: container,
                          debugDescription: "Date string does not match format expected by formatter.")
        }
    }
}

/*
 Sample Response:
 {
     "createdAt": "2022-01-25T14:37:26.128Z",
     "isOccupied": false,
     "maxOccupancy": 34072,
     "id": "2"
   }
 */
