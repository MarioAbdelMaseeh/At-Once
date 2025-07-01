//
//  At_OnceTests.swift
//  At OnceTests
//
//  Created by mac on 12/06/2025.
//

import XCTest
import Combine
import Alamofire
@testable import AtOnce

final class At_OnceTests: XCTestCase {
    
    var cancellables: Set<AnyCancellable>!
        var networkManager: NetworkServiceProtocol!

        override func setUp() {
            super.setUp()
            cancellables = []
            networkManager = NetworkService()
        }

        override func tearDown() {
            cancellables = nil
            networkManager = nil
            super.tearDown()
        }
    


    func testExample(){

        let request = MockAPIRequest(
            baseURL: "http://www.pharmaatoncepredeploy.somee.com",
            path: "/api/Cart/2",
            method: .get,
            headers: ["Content-Type": "application/json"],
            bodyAsDictionary: nil
        )

        let expectation = XCTestExpectation(description: "API should return order stats")

        // When
        networkManager.request(_request: request, responseType: CartResponseDTO.self)
            .sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    XCTFail("Request failed with error: \(error)")
                }
            }, receiveValue: { model in
                // Then
                XCTAssertNotNil(model)

                expectation.fulfill()
            })
            .store(in: &cancellables)

       wait(for: [expectation], timeout: 5.0)
        
        
     
    }

}


struct MockAPIRequest: APIRequest {
    var baseURL: String
    var path: String
    var method: HTTPMethod
    var headers: [String: String]?
    var bodyAsDictionary: [String: Any]?
}
