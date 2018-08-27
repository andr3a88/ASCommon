//
//  CommonsTests.swift
//  ASCommon_Tests
//
//  Created by Andrea on 12/01/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import XCTest
import ASCommon

class CommonsTests: XCTestCase {

    func testClearHTTPCookieStorage() {
        HTTPCookieStorage.shared.clear()
        XCTAssertTrue(HTTPCookieStorage.shared.cookies!.isEmpty)
    }
    
    func testSequenceSum() {
        XCTAssert([1,-1,10,22,-20,50].sum == 62)
    }

    func testArrayAverage() {
        XCTAssert([10,30].average == 20)
    }

    func testCountPredicate() {
        XCTAssert([1,-1,10,22,-20,50].count(where: {$0 > 0}) == 4)
    }

    func testArrayChunk() {
        let array = [0,1,2,3,5,6,7,8,9,10,11]

        let chunkedArray = array.chunk(size: 3)

        XCTAssert(chunkedArray.count == 4)
        XCTAssert(chunkedArray[3].first == 10)
    }

    func testSafeIndex() {
        let array = [0,1,2,3]
        XCTAssertNil(array[safe: 10])
        XCTAssert(array[safe: 0] == 0)
    }
    
    func testCenter() {
        let rect = CGRect(x: 10, y: 10, width: 100, height: 100)
        XCTAssert(rect.center == CGPoint(x: 60, y: 60))
    }
    
    func testSizeByDelta() {
        let size = CGSize(width: 100, height: 100)
        let newSize = size.sizeByDelta(dw: 50, dh: 100)
        XCTAssert(newSize == CGSize(width: 150, height: 200))
    }

    func testStaticStringURL() {
        XCTAssertNotNil(URL(staticString: "https://api.github.com"))
    }
}
