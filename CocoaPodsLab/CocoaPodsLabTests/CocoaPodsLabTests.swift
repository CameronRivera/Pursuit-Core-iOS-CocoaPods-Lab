//
//  CocoaPodsLabTests.swift
//  CocoaPodsLabTests
//
//  Created by Cameron Rivera on 2/27/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import XCTest
@testable import CocoaPodsLab

class CocoaPodsLabTests: XCTestCase {

    func testRandomUsersAPI(){
        // Arrange
        let exp = expectation(description: "An array with a count of 50")
        let expectedNumberOfUsers = 50
        
        // Act
        RandomUsersAPI.retrieveRandomUsers { (result) in
            switch result{
            case .failure(let error):
                XCTFail("Encountered an error loading users: \(error)")
            case .success(let users):
                // Assert
                exp.fulfill()
                XCTAssertEqual(expectedNumberOfUsers, users.count)
            }
        }
        wait(for: [exp], timeout: 3.0)
    }

}
