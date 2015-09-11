//
//  JSONAPIDocumentTests.swift
//  SwiftyJSONAPI
//
//  Created by Thomas Sunde Nielsen on 11.09.15.
//  Copyright © 2015 Thomas Sunde Nielsen. All rights reserved.
//

import XCTest
@testable import SwiftyJSONAPI

class JSONAPIDocumentTests: XCTestCase {

    var testData: NSData!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        if let file = NSBundle(forClass: JSONAPIDocumentTests.self).pathForResource("example-document-1", ofType: "json") {
            self.testData = NSData(contentsOfFile: file)
        } else {
            XCTFail("Could not find test file")
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testImportingDocument() {
        let document = try! JSONAPIDocument(self.testData)
        XCTAssert(document.data.count == 1)
        XCTAssert(document.included.count == 3, "Expected number of included documents to be 2, was \(document.included.count)")
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
//
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            _ = try! JSONAPIDocument(self.testData)
        }
    }

}