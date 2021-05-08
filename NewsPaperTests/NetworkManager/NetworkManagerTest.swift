//
//  NetworkManagerTest.swift
//  NewsPaperTests
//
//  Created by RodaDev on 02.04.2021.
//

@testable import NewsPaper
import XCTest

class NetworkManagerTest: XCTestCase {
    
    var networkManager: NPNetworkManager!
    let url = URL(string: "https://www.gazeta.ru/export/rss/lenta.xml")!

    override func setUpWithError() throws {
        networkManager = NPNetworkManager(url: url)
    }

    override func tearDownWithError() throws {
        networkManager = nil
    }
    
    func testHasData() {
        let expectation = XCTestExpectation(description: "response")
        
        self.networkManager.getData { (data, response, error) in
            
            XCTAssertNotNil(data, "data is nil")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
    func testValidData() {
        
        let expectation = XCTestExpectation(description: "response")
        
        self.networkManager.getData { (data, response, error) in
            
            XCTAssertNotNil(data, "data is nil")
            let string = String(decoding: data!, as: UTF8.self)
            if !string.contains("<author>") {
                XCTAssert(false)
                return
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2)
        
    }
    
    func testWithParser() {
        let expectation = XCTestExpectation(description: "response")
        
        networkManager.getData { (data, response, error) in
            guard let data = data else {
                return
            }
            let xmlParser = XMLParser(data: data)
            let parser = NPRSSParser(xmlParser: xmlParser)
            xmlParser.delegate = parser
            parser.parseToItems { (items) in
                print("Item: \(items[1])")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
}
