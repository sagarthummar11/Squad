//
//  People.swift
//  Squad
//
//  Created by Sagar Thummar on 08/04/2022.
//

import Foundation

struct People: Identifiable, Codable {
    let id: String
    let firstName: String
    let lastName: String
    let avatar: String?
    let email: String?
    let jobtitle: String?
    let favouriteColor: String?
    let createdAt: Date?
    
    var name: String {
        return "\(firstName) \(lastName)"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        avatar = try container.decode(String.self, forKey: .avatar)
        email = try container.decode(String.self, forKey: .email)
        jobtitle = try container.decode(String.self, forKey: .jobtitle)
        favouriteColor = try container.decode(String.self, forKey: .favouriteColor)
        
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
 Sample Respnose:
 {
     "createdAt": "2022-01-24T17:02:23.729Z",
     "firstName": "Maggie",
     "avatar": "https://randomuser.me/api/portraits/women/21.jpg",
     "lastName": "Brekke",
     "email": "Crystel.Nicolas61@hotmail.com",
     "jobtitle": "Future Functionality Strategist",
     "favouriteColor": "pink",
     "id": "1"
   }
 */
