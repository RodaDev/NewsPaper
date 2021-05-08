//
//  CoreDataTest.swift
//  NewsPaperTests
//
//  Created by RodaDev on 04.04.2021.
//

import XCTest
@testable import NewsPaper

class CoreDataTest: XCTestCase {

    var keysVals: [String : Any]?
    var testItem: CDChannel?
    let testTitle = "Тестовый заголовок"

    override func setUpWithError() throws {
        keysVals = ["title": testTitle]
        guard let keysVals = keysVals else {
            return
        }
        testItem = CDChannel.createEntity(keysValues: keysVals, shouldSave: false)
    }

    override func tearDownWithError() throws {
        testItem?.delete()
        keysVals = nil
    }
    
    func testDidCreate() {
        XCTAssertNotNil(testItem, "data is nil")
    }
    
    func testCorrectTitle() {
        guard let channel = testItem,
              let title = channel.title else {
            return
        }
        XCTAssertEqual(title, testTitle)
    }
    
    func testFindChannel() {
        let predicate = NSPredicate(format: "title = %@", testTitle)
        let entity = CDChannel.mr_findFirst(with: predicate)
        XCTAssertNotNil(entity, "cannot find entity")
    }
}
