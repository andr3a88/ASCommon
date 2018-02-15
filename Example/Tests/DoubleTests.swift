//
//  DoubleTests.swift
//  ASCommon_Tests
//
//  Created by Andrea on 12/01/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import XCTest
import ASCommon

class DoubleTests: XCTestCase {
    
    func testRoundTo() {
        
        let number = 34.232423423
        XCTAssert(number.roundTo(places: 2) == 34.23)
        XCTAssert(number.roundTo() == 34)
    }
}

