//
//  SquadPeopleListAPITestCase.swift
//  SquadTests
//
//  Created by Sagar Thummar on 12/04/2022.
//

import XCTest
@testable import Squad

class SquadAPITestCase: XCTestCase {

    let networkManager = NetworkManager()
    
    func test_peoplelistAPI_with_valid_request() {
        networkManager.fetch(requestType: .peopleList, responseType: [People].self) { result in
            switch result {
                case .success(let peopleList):
                    XCTAssertNotNil(peopleList)
                    
                case .failure(let error):
                    XCTAssertNil(error)
            }
        }
    }

    func test_peoplelistAPI_with_invalid_response_type() {
        networkManager.fetch(requestType: .peopleList, responseType: People.self) { result in
            switch result {
                case .success(let peopleList):
                    XCTAssertNil(peopleList)
                    
                case .failure(let error):
                    XCTAssertNotNil(error)
            }
        }
    }
    
    func test_invalid_request_url() {
        networkManager.fetch(requestType: .peopleList, responseType: People.self) { result in
            switch result {
                case .success(let peopleList):
                    XCTAssertNil(peopleList)
                    
                case .failure(let error):
                    XCTAssertNotNil(error)
            }
        }
    }
}
