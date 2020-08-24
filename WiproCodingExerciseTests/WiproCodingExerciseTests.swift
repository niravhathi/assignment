//
//  WiproCodingExerciseTests.swift
//  WiproCodingExerciseTests
//
//  Created by Nirav Hathi on 8/19/20.
//  Copyright © 2020 Nirav Hathi. All rights reserved.
//

import XCTest
@testable import WiproCodingExercise

class WiproCodingExerciseTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testGetAlbumWithExpectedURLHostAndPath() {
        let searchViewModel = SearchViewModel()
        let mockURLSession  = ClientAPIManager()
        searchViewModel.clientAPIManager = mockURLSession
        searchViewModel.fetchDataAlbums(searchText: "paramore") { (bool) in
        }
        XCTAssertEqual(mockURLSession.cachedUrl?.host, "ws.audioscrobbler.com")
    }
    func testGetMoviesWhenEmptyDataReturnsError() {
        let mockURLSession  = ClientAPIManager()
        let errorExpectation = expectation(description: "error")
        var errorResponse: Error?
        mockURLSession.getDataWith(for: "", parameters: [:], completionSuccess: { (result) in
        }) { (error) in
            errorResponse = error
            errorExpectation.fulfill()
        }
        waitForExpectations(timeout: 1) { (error) in
            XCTAssertNotNil(errorResponse)
        }
    }

}
